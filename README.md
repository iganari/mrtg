# 経緯
20141018 本番のソースから枝分かれ 

# 目的
mrtg.gitとmrtg_html.gitの統合
いらないファイルの削除


### MRTGのインストール

```
$ sudo yum install mrtg
$ sudo rm -rfv /etc/mrtg
$ sudo rm -fv  /etc/cron.d/mrtg
$ sudo rm -rfv /var/www/mrtg/
```

### プログラムの設置

```
$ cd /deplop
$ git clone git@github.com:iganari/mrtg.git
```

### httpdの設置

```
$ sudo cp -a ./script/source/mrtg.conf /etc/httpd/conf.d/
$ sudo service httpd restart
```
### crontabを編集可能にする 

```
$ sudo chmod 777 /var/spool/cron
```
### pull-mergeの設定
pullした際にフックを発動させたいので.git/hooksの設定を加筆する。

```
cp -a ./script/source/post-merge ./.git/hooks/
```
基本的はプロジェクトを設置後に一度実行するだけでよい。


### nkfのインストール
MRTGが生成するhtmlはデフォルトでeuc-jpなので、utf-8に変換するコマンドが仕込んである。
そのコマンド(nkf)を予めyumのbaserepoからインストールしておく

```
$ sudo yum install nkf
```
