use LWP::UserAgent;
use strict;
use POSIX;
use LWP::ConnCache;
use Unicode::MapUTF8 qw(to_utf8 from_utf8);
use Encode;
use JSON;
use LWP::Simple;

open (IF,">AA.txt") or die "sadasdsad\n";
my $browser=LWP::UserAgent->new();                                   ##LWP::UserAgent用来请求页面
$browser->agent('Mozilla/4.0 (compatible; MSIE 5.12; Mac_PowerPC)');##伪装一下
$browser->timeout(10);                                               ##request连接超时为10秒
$browser->protocols_allowed(['http','gopher']);                      ##只接受 http 和 gopher 协议
$browser->conn_cache(LWP::ConnCache->new());
my $url ="http://www.cnblogs.com/artech/";
my $ww;
my $response=$browser->get($url);
unless ($response->is_success){
    print LOGFH "无法获取$url -- ",$response->status_line,"\n";
}
## 获取参数
my $con = decode("utf8", $response->content);
$con = encode("gb2312", $con);
#print $con;
$con =~ s/\<.*?\>/,/g;
$con =~ s/,,/,/g;
foreach(@$con){
	
}


#while($con =~ /\>(.+?)\</g){
  #$ww .= $1."\n";
  ##print $1;
#}
print IF $con;
close IF;
## 构建url，获取概率大于一的词
#my $api_url="http://apis.baidu.com/apistore/pullword/words?source=".$con."&param1=1&param2=0";