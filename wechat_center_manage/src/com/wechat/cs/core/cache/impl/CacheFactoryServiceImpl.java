package com.wechat.cs.core.cache.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.wechat.cs.core.cache.IMemcachedManager;

/**
 * <p>Title: redis缓存实现类</p>
 * @author xiaoqiang
 * @date 2017年12月20日 上午11:55:38
 */
@Service
public class CacheFactoryServiceImpl implements IMemcachedManager {

	private String cacheType;
    private Map<String, String> redisMap;


    public void setCacheType(String cacheType) {
        this.cacheType = cacheType;
    }

    public void setRedisMap(Map<String, String> redisMap) {
        this.redisMap = redisMap;
    }

    private IMemcachedManager manager;

    public void initialize() {
        if (this.manager == null) {
            if ("redis".equals(cacheType)) {
                this.manager = new JedisManagerImpl(redisMap);
            }
        }
    }

    public void destroy() {
        if (this.manager != null) {
            this.manager.destroy();
        }
    }

    public Object get(String key) {
        return this.manager.get(key);
    }

    public boolean add(String key, Object value) {
        return this.manager.add(key, value);
    }

    public boolean add(String key, Object value, long expireInSeconds) {
        return this.manager.add(key, value, expireInSeconds);
    }

    public boolean delete(String key) {
        return this.manager.delete(key);
    }

    public void flushAll() {
        this.manager.flushAll();
    }

    public boolean replace(String key, Object value) {
        return this.manager.replace(key, value);
    }

    public boolean replace(String key, Object value, long expireInSeconds) {
        return this.manager.replace(key, value, expireInSeconds);
    }

    public boolean set(String key, Object value) {
        return this.manager.set(key, value);
    }

    public boolean set(String key, Object value, long expireInSeconds) {
        return this.manager.set(key, value, expireInSeconds);
    }

    public List<String> keys() {
        return this.manager.keys();
    }



	@Override
	public List<String> searchkeys(String name) {
		return this.manager.searchkeys(name);
	}


	@Override
	public long decr(String key) {
		return this.manager.decr(key);
	}


	@Override
	public boolean addDraw(String key, Object value, long expireInSeconds) {
		 return this.manager.addDraw(key, value, expireInSeconds);
	}


	@Override
	public long incr(String key) {
		
		return manager.incr(key);
	}


	@Override
	public String getString(String key) {
		return this.manager.getString(key);
	}


	@Override
	public Integer getInt(String key) {
		return this.manager.getInt(key);
	}


	@Override
	public Long getLong(String key) {
		return this.manager.getLong(key);
	}


	@Override
	public long incrBy(String key, long increment) {
		
		return this.manager.incrBy(key, increment);
	}


	@Override
	public long decrBy(String key, long increment) {
		
		return this.manager.decrBy(key, increment);
	}

	@Override
	public boolean setnx(String key, String value, int expireInSeconds) {
		return this.manager.setnx(key, value, expireInSeconds);
	}
}
