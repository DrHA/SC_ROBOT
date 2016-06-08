## 此文件为参数文件
use LWP::UserAgent;
use strict;
use POSIX;
use LWP::ConnCache;
use Unicode::MapUTF8 qw(to_utf8 from_utf8);
use Encode;
use JSON;

## 初始化base_url
sub get_base{
    my @base_urls=qw(
        http://www.cnblogs.com/artech/
		http://www.cnblogs.com/jesse2013/
		http://www.cnblogs.com/asxinyu/
		http://www.cnblogs.com/KnightsWarrior/
		http://www.cnblogs.com/cyq1162/
		http://www.cnblogs.com/CareySon/
		http://www.cnblogs.com/yexiaochai/
		http://www.cnblogs.com/sanshi/
		http://www.cnblogs.com/huangxincheng/
		http://www.cnblogs.com/wuhuacong/
		http://www.cnblogs.com/JimmyZhang/
		http://www.cnblogs.com/shanyou/
		http://www.cnblogs.com/insus/
		http://www.cnblogs.com/zhili/
		http://www.cnblogs.com/toutou/
		http://www.cnblogs.com/lyhabc/   
	);
	return @base_urls;
}
## 初始化浏览器
sub get_browser{
	my $browser=LWP::UserAgent->new();                                   ##LWP::UserAgent用来请求页面
	$browser->agent('Mozilla/4.0 (compatible; MSIE 5.12; Mac_PowerPC)');##伪装一下
	$browser->timeout(10);                                               ##request连接超时为10秒
	$browser->protocols_allowed(['http','gopher']);                      ##只接受 http 和 gopher 协议
	$browser->conn_cache(LWP::ConnCache->new());
	return $browser;
}
1;