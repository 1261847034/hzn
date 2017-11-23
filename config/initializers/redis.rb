$redis = Redis.new(
  host: RedisSetting.host,
  port: RedisSetting.port,
  password: RedisSetting[:password],
  db: RedisSetting.data_db
)
