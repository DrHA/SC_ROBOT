# 主程序
use LWP::UserAgent;
use strict;
use POSIX;
use LWP::ConnCache;
use Unicode::MapUTF8 qw(to_utf8 from_utf8);
use Encode;
use JSON;
require "var_of_sc_robot.pl";
require "some_method.pl";

my @urls;  ## 将要抓取的url
my @usd_urls; ## 已经抓取过的url
my @base_url = get_base();  ## 可以自定义
##
my $url ="http://www.cnblogs.com/artech/";
my $browser = get_browser();
my $response=$browser->get($url);
unless ($response->is_success){
    print LOGFH "无法获取$url -- ",$response->status_line,"\n";
}
my $con = decode("utf8", $response->content);
$con = encode("gb2312", $con);
while($con =~ /href=\"(.+?)\"/g){
   print $1."\n";
   ## todo 去重
}
#print $con;














