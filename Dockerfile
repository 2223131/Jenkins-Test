# 选择官方OpenJDK基础镜像
FROM openjdk:17-jdk-slim

# 创建一个目录存放应用
WORKDIR /app

# 把你的jar文件复制进容器
COPY target/Jenkins-Test-0.0.1-SNAPSHOT.jar app.jar

# 开放端口（根据你的程序实际端口）
EXPOSE 8123

# 启动命令
ENTRYPOINT ["java", "-jar", "app.jar"]