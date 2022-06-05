# FSCalendarSample
  <img src="https://user-images.githubusercontent.com/88915966/172045688-86500620-3b2f-4c1d-9d42-88dea8c12052.png" width="500">

### 環境構築
#### cocoapodsのインストール

##### エラーが出る
~~~
sudo gem install cocoapods

ERROR:  Error installing cocoapods:
	zeitwerk requires Ruby version >= 2.5.
~~~

##### rbenvを確認する → 見つからない！！
~~~
rbenv install --list
-bash: rbenv: command not found
~~~

##### ならrbenvを入れよう
~~~
brew install rbenv ruby-build
・・・
Error: The contents of the SDKs in your Command Line Tools (CLT) installation do not match the SDK folder names.
A clean reinstall of Command Line Tools (CLT) should fix this.
~~~

##### CLTのバージョン？　正しく参照できていないらしい
- CLTをインストールし直す
~~~
sudo rm -rf /Library/Developer/CommandLineTools

sudo xcode-select --install
~~~

#### バージョン確認できた
~~~
knobuhara$ rbenv install -l
2.6.10
2.7.6
3.0.4
3.1.2
jruby-9.3.4.0
mruby-3.0.0
rbx-5.0
truffleruby-22.1.0
truffleruby+graalvm-22.1.0
~~~

#### 一番上の2.6.10をインストール
~~~
rbenv install 2.6.10
~~~

#### もう一度cocoapodsを試してみる、今度はパスを指定する
- なんと新しい問題が。。。FilePermissionError
~~~
sudo gem install cocoapods -n /usr/local/bin

ERROR:  While executing gem ... (Gem::FilePermissionError)
~~~

#### 環境変数が設定されていないかな？
- ↓globalする必要がある
~~~
rbenv global 2.6.10

  system
* 2.6.10 (set by /Users/knobuhara/.rbenv/version)
~~~

#### .zshrcを追加
~~~
# rbenv にパスを通す
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"
~~~

- ファイルを保存して、環境変数を反映する
~~~
source ~/.zshrc 
~~~

#### 諦めずに、もう一度チャレンジ
~~~
sudo gem install cocoapods -n /usr/local/bin
・・・
Done installing documentation for concurrent-ruby．．．
35 gems installed
~~~

#### 感動しました！！！一通り確認してみる
~~~
which ruby
/Users/knobuhara/.rbenv/shims/ruby

ruby -v
ruby 2.6.10p210 (2022-04-12 revision 67958) [x86_64-darwin18]

pod --version
1.11.3
~~~

#### podをセットアップ
~~~
pod setup
Setup completed
~~~

### 苦労しましたが、最後まで環境構築成功！！

#### ここからプロジェクトに適用
- 初期化
~~~
cd /Volumes/Data/src/xxx
pod init
pod install
Analyzing dependencies
Adding spec repo `trunk` with CDN `https://cdn.cocoapods.org/`
Downloading dependencies
Installing FSCalendar (2.8.4)
Generating Pods project
Integrating client project
~~~

- xxx.xcworkspaceが生成されるので、ダブルクリックで起動
  - プロジェクトが起動され、Podsがインストールされた
- Main.storyboardにviewを貼り付け、ClassをFSCalendorに指定　→ 完成
