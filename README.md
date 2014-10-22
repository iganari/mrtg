# 経緯
20141018 本番のソースから枝分かれ 

# 目的
mrtg.gitとmrtg_html.gitの統合
いらないファイルの削除



## ファイル設置後にやること

### httpdの設置

```
cd `dirname README | pwd`
sudo cp ./script/source/mrtg.conf /etc/httpd/conf.d/
sudo service httpd restart
```


### crontabを編集可能にする 

```
chmod 777 /var/spool/cron
```
### pull-mergeの設定
pullした際にフックを発動させたいので.git/hooksの設定を加筆する。

```
cp -a ./script/source/post-merge ./.git/hooks/
```
基本的はプロジェクトを設置後に一度実行するだけでよい。

