## 此文件保存工具
use LWP::UserAgent;
use strict;
use POSIX;
use LWP::ConnCache;
use Unicode::MapUTF8 qw(to_utf8 from_utf8);
use Encode;
use JSON;

## 使用百度api分词
sub split_word{

    ## 获取参数
	my $con = shift;
	my $browser = shift;
	## 返回的变量
	my $res_w;
	## 构建url，获取概率大于0.8的词
    my $api_url="http://apis.baidu.com/apistore/pullword/words?source=".$con."&param1=0.8&param2=0";
    my $content = get $api_url || return "1";
	
	## 获取参数
	## get url
	my $response=$browser->get($api_url,"apikey" => "63b303cb88bd0c419065196069174b28");
	unless ($response->is_success){
		print LOGFH "无法获取$api_url -- ",$response->status_line,"\n";
		return "";
	}
	## 解码
	my $content = decode("utf8", $response->content);
	##解json
	my $word_results = JSON->new->utf8->decode($content);
	if($word_results->{errMsg}){
		return "";
	}else{
	    my @word_results = split(/\n/,$content);
		foreach(@word_results){
		    ## 获取以逗号分开
			$res_w.=$_;	
		}
	}
	return $res_w;
		
}

1;

