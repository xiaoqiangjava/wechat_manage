package com.wechat.cs.core.cache;

import java.util.List;

/**
 * Created with Btc.
 * User: zhangq
 * DateTime: 2014/7/15 13:47
 * To change this template use File | Settings | File Templates.
 */

public interface IMemcachedManager {
	void destroy();

    Object get(String key);
    
    boolean setnx(String key, String value, int expireInSeconds);

    boolean add(String key, Object value);

    boolean add(String key, Object value, long expireInSeconds);

    boolean delete(String key);

    void flushAll();

    boolean replace(String key, Object value);

    boolean replace(String key, Object value, long expireInSeconds);

    boolean set(String key, Object value);

    boolean set(String key, Object value, long expireInSeconds);
    String getString(String key);
    Integer getInt(String key);
    Long getLong(String key);
    
    /**
     * 获取所有键值
     * @return
     */
    List<String> keys();
    
    /**
     * 按照名称搜索
     * @param name
     * @return
     */
    List<String> searchkeys(String name);

    /**
     * 对key对应的数字做减1操作
     * @param key 缓存key
     * @return 对key对应的数字做减1操作
     */
    long decr(String key);
    
    /**
     * add抽奖次数，无允许序列化操作
     * @param key 缓存key
     * @param value 缓存value
     * @param expireInSeconds 缓存key的失效时间
     * @return
     */
    boolean addDraw(String key, Object value, long expireInSeconds);
    
    
    /**
     * 对key对应的数字做加1操作
     * @param key
     * @return
     */
    long  incr(String key);
    
    /**
     * 对key对应的数字做加increment操作
     * @param key
     * @param increment 增量
     * @return
     */
    long  incrBy(String key,long increment);
    
    /**
     * 对key对应的数字做定减
     * @param key
     * @param increment
     * @return
     */
    long decrBy(String key,long increment);
}
