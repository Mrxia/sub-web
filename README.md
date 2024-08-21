# sub-web

基于 vue-cli 与 [tindy2013/subconverter](https://github.com/tindy2013/subconverter) 后端实现的配置自动生成。

## Table of Contents

- [ChangeLog](#ChangeLog)
- [Docker](#Docker)
- [Requirements](#Requirements)
- [Install](#install)
- [Usage](#usage)
- [Related](#Related)
- [Contributing](#contributing)
- [License](#license)

## ChangeLog

- 20200730

  - 独立各类后端配置到 .env 文件中，现在修改后端只需要修改 .env 即可。

## Docker

拉取镜像仓库到你的服务器，进入sub-web目录，利用docker buildx构建镜像

```shell
docker run -d -p 58080:80 --restart always --name subweb xiao6666/subweb:latest
```

若需要对代码进行修改，你需要在本地构建镜像并运行。
注：每次修改代码，你都需要重新执行 docker build 来执行打包操作。

```shell
docker -v
Docker version 23.0.4, build f480fb1

sudo docker buildx build --platform linux/amd64 -f ./Dockerfile --output "type=docker,name=sub-web:latest" .

#推送至docker hub
sudo docker buildx build --platform linux/amd64,linux/arm64 -f ./Dockerfile --output "type=image,name={你的名称}/{仓库名称}:latest,push=true" .

docker run -d -p 58080:80 --restart always --name subweb subweb-web:latest
```

# 搭配

具体教程请参考[我的博客](https://www.dzkeji.site/2024/08/1724228028645)

使用MyUrls短链时,需改写.env文件
```
# 短链接后端
VUE_APP_MYURLS_API = "https://你的域名/short"
```
请务必在域名结尾加上`/short`,否则将无法使用短链功能


## 展示图

![image-20240815111446054](https://cdn.jsdelivr.net/gh/Mrxia/Image-hosting/images/202408162319896.png)


## Related

- [tindy2013/subconverter](https://github.com/tindy2013/subconverter)
- [CareyWang/MyUrls](https://github.com/CareyWang/MyUrls)
- [Mrxia/MyUrls](https://github.com/Mrxia/MyUrls)

## Contributing

PRs accepted.

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

MIT © 2020 CareyWang
