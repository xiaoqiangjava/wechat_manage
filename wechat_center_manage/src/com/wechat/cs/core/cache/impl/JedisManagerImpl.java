package com.wechat.cs.core.cache.impl;

import com.wechat.cs.core.cache.IMemcachedManager;
import com.wechat.cs.core.utils.CommonUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import redis.clients.jedis.*;
import redis.clients.util.Hashing;
import redis.clients.util.Sharded;

import java.util.*;
/**
 * <p>Title: 初始化redis</p>
 * @author xiaoqiang
 * @date 2017年12月20日 上午11:56:10
 */
public class JedisManagerImpl implements IMemcachedManager {

	private Logger logger = LoggerFactory.getLogger(JedisManagerImpl.class);

    /**
     * 切片连接池
     */
    private ShardedJedisPool shareRedisPool;

    /**
     * 服务器列表
     */
    private String servers;

    /**
     * 最大连接数, 默认8个
     */
    private int maxTotal;

    /**
     * 最大空闲连接数, 默认8个
     */
    private int maxIdle;

    /**
     * 最小空闲连接数, 默认0
     */
    private int minIdle;

    /**
     * 在获取连接的时候检查有效性, 默认false
     */
    private boolean testOnBorrow;

    /**
     * 连接耗尽时是否阻塞, false报异常,ture阻塞直到超时, 默认true
     */
    private boolean blockWhenExhausted;

    /**
     * 获取连接时的最大等待毫秒数(如果设置为阻塞时BlockWhenExhausted),如果超时就抛异常, 小于零:阻塞不确定的时间,  默认-1
     */
    private long maxWaitMillis;

	/**
	 * 服务器密码
	 */
	private String password;

    /**
     * 构造函数
     */
    public JedisManagerImpl(Map<String, String> paramMap) {
        this.servers = paramMap.get("redis.servers");
        this.maxTotal = Integer.parseInt(paramMap.get("redis.pool.maxTotal"));
        this.maxIdle = Integer.parseInt(paramMap.get("redis.pool.maxIdle"));
        this.minIdle = Integer.parseInt(paramMap.get("redis.pool.minIdle"));
        this.testOnBorrow = Boolean.parseBoolean(paramMap.get("redis.pool.testOnBorrow"));
        this.blockWhenExhausted = Boolean.parseBoolean(paramMap.get("redis.pool.blockWhenExhausted"));
        this.maxWaitMillis = Long.parseLong(paramMap.get("redis.pool.maxWaitMillis"));
        this.password=paramMap.get("redis.password");
        initialize();
    }

    /**
     * Jredis 初始化
     */
    public void initialize() {
        try {
            logger.info("JredisCache initialize start");
            JedisPoolConfig config = new JedisPoolConfig();
            config.setMaxTotal(maxTotal);
            config.setMaxIdle(maxIdle);
            config.setMinIdle(minIdle);
            config.setTestOnBorrow(testOnBorrow);
            config.setBlockWhenExhausted(true);
            config.setMaxWaitMillis(maxWaitMillis);
            String[] serverArray = servers.split(",");
            List<JedisShardInfo> jdsInfoList = new ArrayList<JedisShardInfo>(serverArray.length);
            for (String ipp : serverArray) {
                String[] ip_port = ipp.split(":");
                String ip = ip_port[0];
                //注意port一定要转为int类型(不能为String),否则JedisShardInfod初始化时，
                //会将该String作为节点name名称,而把默认的6379作为端口号
                int port = Integer.parseInt(ip_port[1]);
                JedisShardInfo jedisShardInfo = new JedisShardInfo(ip, port);
                if(password!=null&&!password.equals("")){
                	jedisShardInfo.setPassword(password);
                }
                
                jdsInfoList.add(jedisShardInfo);
            }
            shareRedisPool = new ShardedJedisPool(config, jdsInfoList, Hashing.MURMUR_HASH, Sharded.DEFAULT_KEY_TAG_PATTERN);
            
            logger.info("JredisCache initialize end");
        } catch (Exception e) {
            logger.info("JredisCache initialize fail", e);
        }
    }


    public void destroy() {

    }

    @Override
    public Object get(String key) {
    	 ShardedJedis resource = shareRedisPool.getResource();

    	
        byte[] valueBytes = resource.get(key.getBytes());
        Object unserialize = null;
        try{
	        if (valueBytes == null || valueBytes.length == 0) {
	            //如果获取为空则在整个池子里面获取
	            Collection<Jedis> list = resource.getAllShards();
	            for (Jedis j : list) {
	                valueBytes = j.get(key.getBytes());
	                if (valueBytes != null && valueBytes.length != 0) {
	                	unserialize = CommonUtil.unserialize(valueBytes);
	                }
	            }
	        } else {
	            unserialize = CommonUtil.unserialize(valueBytes);
	        }
        }catch(Exception e){
        	e.printStackTrace();
        }finally{
            resource.close();
        }
        return unserialize;
    }

    @Override
    public boolean add(String key, Object value) {
        return add(key, value, 1800);
    }

    @Override
    public boolean add(String key, Object value, long expireInSeconds) {
        ShardedJedis resource = shareRedisPool.getResource();

        @SuppressWarnings("unused")
		Collection<Jedis> keySet = resource.getAllShards();  
        try{
            byte[] bytes = key.getBytes();
	        if (bytes != null && bytes.length > 0) {
	            byte[] values = CommonUtil.serialize(value);
	            String setExRes = resource.setex(bytes, (int) expireInSeconds, values);
	            logger.info("setExRes :" + setExRes);
	        }
        }catch(Exception e){
        	e.printStackTrace();
        }finally{
        	resource.close();
        }
        return true;
    }

    @Override
    public boolean delete(String key) {
        ShardedJedis resource = shareRedisPool.getResource();
        if (resource.exists(key.getBytes())) {
            resource.del(key);
        }
        resource.close();
        return true;
    }

    @Override
    public boolean replace(String key, Object value) {
        if (this.get(key) != null) {
            this.delete(key);
        }
        
        return this.add(key, value);
    }


    @Override
    public boolean replace(String key, Object value, long expireInMills) {
        if (this.get(key) != null) {
            this.delete(key);
        }
        return this.add(key, value, expireInMills);
    }

    @Override
    public boolean set(String key, Object value) {
        return set(key, value, 1800);
    }

    @Override
    public boolean set(String key, Object value, long expireInMills) {
        if (this.get(key) != null) {
            return this.replace(key, value, expireInMills);
        } else {
            return this.add(key, value, expireInMills);
        }
        
    }

    public List<String> keys() {
   	 ShardedJedis resource = shareRedisPool.getResource();
     Collection<Jedis> jedislist = resource.getAllShards();
     List<String> keylist= new LinkedList<>();
     for (Jedis j : jedislist) {
     	Set<String> keyset = j.keys("*");
     	for(String keyname:keyset){
     		keylist.add(keyname);
     	}
     }
    return keylist;
}


    @Override
    public void flushAll() {
        ShardedJedis resource = shareRedisPool.getResource();
        Collection<Jedis> list = resource.getAllShards();
        for (Jedis j : list) {
            j.flushDB();
        }
        resource.close();
    }

    public ShardedJedisPool getShareRedisPool() {
        return shareRedisPool;
    }

    public void setShareRedisPool(ShardedJedisPool shareRedisPool) {
        this.shareRedisPool = shareRedisPool;
    }

    public String getServers() {
        return servers;
    }

    public void setServers(String servers) {
        this.servers = servers;
    }

    public int getMaxIdle() {
        return maxIdle;
    }

    public void setMaxIdle(int maxIdle) {
        this.maxIdle = maxIdle;
    }


    public int getMaxTotal() {
        return maxTotal;
    }

    public void setMaxTotal(int maxTotal) {
        this.maxTotal = maxTotal;
    }

    public int getMinIdle() {
        return minIdle;
    }

    public void setMinIdle(int minIdle) {
        this.minIdle = minIdle;
    }

    public long getMaxWaitMillis() {
        return maxWaitMillis;
    }

    public void setMaxWaitMillis(long maxWaitMillis) {
        this.maxWaitMillis = maxWaitMillis;
    }

    public boolean isTestOnBorrow() {
        return testOnBorrow;
    }

    public void setTestOnBorrow(boolean testOnBorrow) {
        this.testOnBorrow = testOnBorrow;
    }

    public boolean isBlockWhenExhausted() {
        return blockWhenExhausted;
    }

    public void setBlockWhenExhausted(boolean blockWhenExhausted) {
        this.blockWhenExhausted = blockWhenExhausted;
    }


	public List<String> searchkeys(String name) {
	   	 ShardedJedis resource = shareRedisPool.getResource();
	     Collection<Jedis> jedislist = resource.getAllShards();
	     List<String> keylist= new LinkedList<>();
	     for (Jedis j : jedislist) {
	     	Set<String> keyset = j.keys("*"+name+"*");
	     	for(String keyname:keyset){
	     		keylist.add(keyname);
	     	}
	     }
	    return keylist;
}

	@Override
	public long decr(String key) {
		ShardedJedis shardJedis = null;
        long statusCode=0;
        try{
        	shardJedis = shareRedisPool.getResource();
            statusCode = shardJedis.decr(key);
        }catch (Exception e){
           e.printStackTrace();
        }finally{
        	shareRedisPool.returnResource(shardJedis);
        }
        return statusCode;
	}

	@Override
	public boolean addDraw(String key, Object value, long expireInSeconds) {
		ShardedJedis resource = shareRedisPool.getResource();
        try{
            byte[] bytes = key.getBytes();
	        if (bytes != null && bytes.length > 0) {
	            String setExRes = resource.setex(bytes, (int) expireInSeconds, value.toString().getBytes());
	            logger.info("setExRes :" + setExRes);
	        }
        }catch(Exception e){
        	e.printStackTrace();
        }finally{
        	resource.close();
        }
        return true;
	}

	@Override
	public long incr(String key) {
		ShardedJedis resource = shareRedisPool.getResource();
		long  l = 0;
		try {
			 l = resource.incr(key);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			resource.close();
		}
		return l ;
	}

	@Override
	public String getString(String key) {
		// TODO Auto-generated method stub
		ShardedJedis resource = shareRedisPool.getResource();
		try {
			return resource.get(key);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			resource.close();
		}
		return null;
	}

	@Override
	public Integer getInt(String key) {
		// TODO Auto-generated method stub
		ShardedJedis resource = shareRedisPool.getResource();
		try {	
			String value = resource.get(key);
			return Integer.parseInt(value == null ? "0" : value);
		} catch (Exception e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
		}finally{
			resource.close();
		}
		return null;
	}

	@Override
	public Long getLong(String key) {
		// TODO Auto-generated method stub
		ShardedJedis resource = shareRedisPool.getResource();
		try {
			String value = resource.get(key);
			return Long.parseLong(value == null ? "0" : value);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			resource.close();
		}
		return null;
	}

	@Override
	public long incrBy(String key, long increment) {
		
		ShardedJedis resource = shareRedisPool.getResource();
		long  l = 0;
		try {
			 l = resource.incrBy(key,increment);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			resource.close();
		}
		return l ;
	}

	@Override
	public long decrBy(String key, long increment) {
		ShardedJedis resource = shareRedisPool.getResource();
		long  l = 0;
		try {
			 l = resource.decrBy(key,increment);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			resource.close();
		}
		return l ;
	}

	@Override
	public boolean setnx(String key, String value, int expireInSeconds) {
		ShardedJedis shardJedis = shareRedisPool.getResource();
		Long resultCode = 0L;
		try
        {
        	resultCode = shardJedis.setnx(key, value);
        	if(resultCode == 1){
        		resultCode = shardJedis.expire(key, expireInSeconds);
        	}
        }
        catch (Exception e)
        {
          e.printStackTrace();
        }
        finally
        {
        	shareRedisPool.returnResource(shardJedis);
        }
        return 0L == resultCode ? false : true;
	}
}