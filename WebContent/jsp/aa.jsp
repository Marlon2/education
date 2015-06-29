<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="GBK">
<title>支付宝 - 网上支付 安全快速！</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="中国最大的第三方电子支付服务提供商" />
<link rel="shortcut icon" href="https://i.alipayobjects.com/e/201310/1HFsvDt0EB.ico" type="image/x-icon" />

<link charset="utf-8" rel="stylesheet" href="https://a.alipayobjects.com/cashierx/cashier/1.0.2/fastpay.css" media="all" /><link href="https://a.alipayobjects.com" rel="dns-prefetch" />
<link href="https://app.alipay.com" rel="dns-prefetch" />
<link href="https://my.alipay.com" rel="dns-prefetch" />
<link href="https://lab.alipay.com" rel="dns-prefetch" />
<link href="https://cashier.alipay.com" rel="dns-prefetch" />
<link href="https://financeprod.alipay.com" rel="dns-prefetch" />
<link href="https://shenghuo.alipay.com" rel="dns-prefetch" />

<style type="text/css">
.checkout .checkout_btn3{
background: #e43f42;
border: 1px solid #e43f42;
box-shadow: inset 0 1px 0 #e43f42;
/* background-image: linear-gradient(to bottom, #ff6501, #ff5411); */
width: 140px;
height: 38px;
line-height: 38px;
text-align: center;
font-size: 18px;
display: inline-block;
cursor: pointer;
margin-left: 10px;
}
</style>

<!-- CMS:cms/监控埋点/前端监控前置脚本开始:tracker/monitor.vm --><script type="text/javascript">
(function(e){if(!e.monitor){var a=e.monitor={};a._DATAS=[];var f=a._EVENTS=[];a.on=function(a,d){f.push([a,d])};a.off=function(){};a.log=function(c,d){if(c&&!(3<=arguments.length)){var b;"[object Object]"===Object.prototype.toString.call(c)?(b=c,b.profile=d||b.profile||"log"):b={profile:d||"log",seed:c};a._DATAS.push(b);return b}}}})(this);
(function(h,c){function q(a){return(a=String(a).match(r))?a[0]:"global"}function f(a,m,n,g,f,d,k){if(!k&&arguments.callee.caller){for(var b=arguments.callee.caller,e=[],h=0;b.arguments&&b.arguments.callee&&b.arguments.callee.caller;){b=b.arguments.callee.caller;e.push("at "+q(b));if(b.caller===b)break;if(h++>s)break}k=e.join("\n")}b={profile:t,type:a,msg:m||"",file:n||"",line:g||0,col:f||0,num:d||"",stack:k||"",lang:navigator.language||navigator.browserLanguage||"",lost:l.join(",")};
e=n+":"+g+":"+m;p.hasOwnProperty(e)||(b.uv=1,p[e]=!0);return c.log(b)}if(c){var t="jserror",s=20,r=/^\s*function\b[^\)]+\)/,l=[],d={};c.lost=function(a){if(!d.hasOwnProperty(a))return d[a]=!0,l.push(a),l};var p={};c.error=function(a){if(a instanceof Error)return f("catched",a.message||a.description,a.filename||a.fileName||a.sourceURL,a.lineno||a.lineNumber||a.line,a.colno||a.columnNumber,a.number,a.stack||a.stacktrace)};h.onerror=function(a,c,d,g){f("global",a,c,d,g);return!1}}})(this,this.monitor);
</script><!-- CMS:cms/监控埋点/前端监控前置脚本结束:tracker/monitor.vm -->
<!-- CMS:全站公共 cms/tracker/seajs.vm开始:tracker/seajs.vm -->	

<!-- seajs以及插件 -->
<script charset="utf-8" crossorigin="anonymous" id="seajsnode" onerror="window.monitor && monitor.lost && monitor.lost(this.src)" src="https://a.alipayobjects.com/??seajs/seajs/2.2.3/sea.js,seajs/seajs-combo/1.0.0/seajs-combo.js,seajs/seajs-style/1.0.2/seajs-style.js,seajs/seajs-log/1.0.0/seajs-log.js,jquery/jquery/1.7.2/jquery.js,gallery/json/1.0.3/json.js,alipay-request/3.0.3/index.js"></script>

<!-- seajs config 配置 -->
<script>
seajs.config({
  alias: {
    '$': 'jquery/jquery/1.7.2/jquery',
    '$-debug': 'jquery/jquery/1.7.2/jquery',
    'jquery': 'jquery/jquery/1.7.2/jquery',
    'jquery-debug': 'jquery/jquery/1.7.2/jquery-debug',
    'seajs-debug': 'seajs/seajs-debug/1.1.1/seajs-debug'
  },
  crossorigin: function(uri){
  
    function typeOf(type){
	  return function(object){
	    return Object.prototype.toString.call(object) === '[object ' + type + ']';
	  }
	}
	var isString = typeOf("String");
	var isRegExp = typeOf("RegExp");
    
	var whitelist = [];
	
                  whitelist.push('https://a.alipayobjects.com/');
          	
	for (var i=0, rule, l=whitelist.length; i<l; i++){
	  rule = whitelist[i];
	  if (
	    (isString(rule) && uri.indexOf(rule) === 0) ||
	    (isRegExp(rule) && rule.test(uri))
		) {
		
	    return "anonymous";
	  }
	}
  },
  vars: {
    locale: 'zh-cn'
  }
});
</script>

<!-- 兼容原有的 plugin-i18n 写法 -->
<!-- https://github.com/seajs/seajs/blob/1.3.1/src/plugins/plugin-i18n.js -->
<script>
seajs.pluginSDK = seajs.pluginSDK || {
  Module: {
    _resolve: function() {}
  },
  config: {
    locale: ''
  }
};
// 干掉载入 plugin-i18n.js，避免 404
seajs.config({
  map: [
	[/^.*\/seajs\/plugin-i18n\.js$/, ''],
	[/^.*\i18n!lang\.js$/, '']
  ] 
});
</script>
    <style>
            .icon-gray {
  filter: url("https://cashierzth.alipay.com:443/filters.svg#grayscale");
  filter:gray\9;
  -webkit-filter: grayscale(90%);
}
/* 天猫点劵卡样式开始 */
.tmallPcardMargin {
  margin-right: 38px;
}

.account-item-grayMask {
  position: relative;
}

.account-item-grayMask .ui-grayMask {
  height: 38px;
}

/* 天猫点劵卡样式结束 */
.manage-list .morebank {
  _display: inline-block;
}

/*优惠标签，IE6,7,8一像素空格hack*/
.promotion-icon .promotion-icon-type {
  padding-top: 1px\9  !important;
+ position : relative;
+ top : - 1 px;
}

/* 余额宝icon动画 */
.moneyFundIcon {
  width: 35px;
  height: 25px;
  position: relative;
  top: 5px;
  line-height: 50px;
  display: inline-block;
  background-image: url("https://i.alipayobjects.com/i/ecmng/png/201404/2Q4gokT43Z.png");
}

.moneyFundTextStyle {
  font-size: 16px;
  margin: 10px 10px 10px 2px;
}

.moneyFundExplain {
  background-color: #f47b5a;
  color: white;
  padding: 2px 10px 2px 10px;
    line-height: 16px;
}
.mfe-tip-warp{
    width: 320px;
}
.mfe-tip-title{
    line-height: 20px;
}

.explaintext {
  display: none;
}


.manage-item .fn-green{
  color:#393;
}
/* 超限科学引导开始 */
.extra-item .ui-button-guide {
  color: #000;
  background-color: #fafafa;
  padding: 0 10px;
  font-size: 12px;
  font-weight: normal;
  margin-top: 6px;
  margin-bottom: 10px;
}
.extra-item .ui-tipbox-recommend {
  color: #fff;
  background-color: #d9524e;
  padding: 1px 4px 2px 4px;
  margin-right: 4px;
  border-radius: 2px;
}
/* 超限科学引导结束 */


/* 账户渠道开始*/
  .account-chls {
    margin-bottom: 20px;
    padding: 0 20px;
  }
  .account-chl {
    position: relative;
    height: 20px;
    margin-bottom: 1px;
    padding: 8px 20px 8px 18px;
  }
  .account-chl-used {
    background: #E9F0FE;
  }
  .account-chl-disabled {
    color: #999;
  }
  .account-chl .iconfont {
    font-size: 14px;
  }
  .account-chl em {
    font-weight: bold;
  }
  .account-amount {
    position: absolute;
    right: 39px;
    top: 9px;
    line-height:18px;
  }
  .account-amount em{
    font-size: 14px;
    color: #f60;
    font-weight:700;
  }
  /* 购物卡 */
  .account-card {
    margin-right: 4px;
    padding: 2px 4px;
    border: 1px dashed #bbcbef;
    background: #fff;
  }
  .account-card-used {
    padding: 1px 4px;
    border: 2px solid #ffac21;
  }
  .account-card-err {
    border-color: #f00;
  }
  .account-card em{
    font-weight: bold;
  }
  .account-card i {
    color: #999;
  }
/* 账户渠道结束*/

.limit-result-off{margin-left:8px;}
.limit-result-off{
  display:none
}

.ch-limiting .icon-limit-exceed{
  display:inline;
}
.action-rt-gray .limit-result-off{
  display:none
}

#fastpay-dacu-maintip{text-align:center;}
#fastpay-dacu-maintip .cms-dacu-maintip{
  display:inline-block;
  height: 28px;
  line-height: 28px;
  background-color: #FF6600;
  color: #FFFFFF;
  padding: 0 15px;
  overflow: hidden;
}

/* 分期用到 */
.ui-select-trigger-disabled {
    background-image: -moz-linear-gradient(center top , #FBFBFB, #F3F3F3);
    border-color: #CCCCCC;
    color: #B2B2B2;
    cursor: default;
}


/* 渠道加载 loading */
.ui-loading-wrap {
  position: relative;
  margin: 20px 0;
  height: 50px;
  line-height: 50px;
}

.ui-loading-wrap .ui-loading {
  position: absolute;
  top: 0;
  left: 0;
}
.ui-loading-wrap .ui-tipbox-content-simple {
  margin-left: 60px;
}

.action-rt {
  line-height: 14px;
  height: 14px;
  font-size: 12px !important;
  background-color: #FFFFFF !important;
  border: 1px solid #1E73C1;
  color: #1E73C1;
  margin-right: 2px;
  display: inline-block;
  zoom: 1;
}

.action-rt .action-rt-type {
  background-color: #1E73C1;
  display: inline-block;
  color: #ffffff;
  height: 14px;
  line-height: 14px;
  padding: 0 2px;
}

.action-rt .rt-discount {
  color: #1E73C1;
  padding: 0;
  background: none;
}
.action-rt-gray .action-rt {
  border: 0;
  background-color: #cccccc !important;
  color: #FFFFFF !important;
}
.action-rt-gray .action-rt-type,
.action-rt-gray .rt-discount {
  background-color: #cccccc !important;
  color: #FFFFFF !important;
}

.channel-label .ui-fm-error .ui-fm-explain {
  color: #FF5243;
  padding: 3px 0 0;
  padding: 5px 0 0 \9;
  _padding-top: 3px;
  _margin-left: 3px;
  font-size: 12px;
  padding-left: 20px;
  background: url(https://i.alipayobjects.com/e/201208/3JRI1gkfUX.png) no-repeat -138px -83px;
}
    </style>
</head>
<body>
<script>	    
	window.alieditContainer=null;	
</script><!-- CMS:收银台cms/公用CMS/通知吊顶结束:cashier/common/notice.vm -->
<div id="content">
<style>
  .order-with-qr .qr {
    border: 0;
    width: 100px;
    height: 100px;
    background: none;
  }

  .order-with-qr .order-wrapper {
    padding-top: 15px;
    padding-left: 116px;
    min-height: 96px;
  }
  .order-with-qr .qr .qr-wrapper {
    background: none;
  }
  .order-with-qr .qr .qr-wrapper table {
    position: relative;
    top: 14px;
    left: 14px;
  }
  .order-with-qr .order-amount {
    top: 40px;
  }
</style>


        
<!-- 订单信息 开始 -->
<div id="J_Order" class="order order-with-qr"
    data-notShowBarCode=""
    data-resultQueryStartDelay="5000"
    data-resultQueryPace="3000"
    data-payResultQueryMaxTimes="200"
    data-codeInfo="https://qr.alipay.com/_d?_b=TRADE_DY&amp;mergeOrder=false&amp;tradeNo=2015060121001001740217704020"
    data-isNeedPollResult="true"
    data-isNeedLongPoll="true">

    <div class="order-wrapper">
                            <div class="qr J_APop"  data-arrowPosition="10"  data-target="J_QrTip">
                                <div id="J_QrWrapper" class="qr-wrapper"></div>
            </div>
            <script id="J_QrTip" type="text/tip-template"><div class="qr-tip"><!-- CMS:收银台cms/公用CMS/订单详情二维码tip开始:common/qrCodeTip.vm -->


<!-- CMS:收银台cms/公用CMS/订单详情二维码tip结束:common/qrCodeTip.vm --></div></script>
                
        
  <div class="order-title">
  天猫Tmall--名仕爵正品陀飞轮手表真皮带时尚机械表男表镂空防水男士腕表
 </div><div class="order-seller">
    卖家昵称：mstre纳岚客专卖店
</div><div class="order-amount">
            <div class="order-real-amount">
    <em class="">395.00</em>元 <i class="iconfont" title="刷新">
    <a href="http://cashierzth.alipay.com/standard/fastpay/fastPayCashier.htm?outBizNo=2015060121001001740217704020&amp;timeStamp=1433154618667&amp;bizIdentity=trade10001&amp;orderId=06013e54d951caa65b00c78011137740&amp;country=CN" class="order-reload" seed="get_price">&#xF058;</a>
   </i>
     </div>
    </div><!-- 更多订单信息 开始 -->
        <a id="J_OrderExtTrigger" class="order-ext-trigger" href="#" seed="order-detail-more">
            <i class="iconfont" title="记录">&#xF055;</i>
            订单详情
        </a>

        <p id="J_OrderExtLoading" class="order-ext-loading fn-hide">
            加载订单详情信息...
                            <a href="http://cashierzth.alipay.com/standard/fastpay/fastPayCashier.htm?outBizNo=2015060121001001740217704020&amp;timeStamp=1433154618667&amp;bizIdentity=trade10001&amp;orderId=06013e54d951caa65b00c78011137740&amp;country=CN" seed="refresh-account">刷新</a>
                    </p>

        <div id="J_OrderExt" class="order-ext fn-hide" data-url="https://cashierzth.alipay.com:443/tile/service/standard:orderDetailAsyncProxy.tile?outBizNo=2015060121001001740217704020&outRelationId=&bizIdentity=trade10001&signData=dcb9d9a54956d04c1035bced96665592&orderId=06013e54d951caa65b00c78011137740"></div>
        <!-- 更多订单信息 结束 -->
    </div>
</div>
  <!-- CMS:收银台cms/fastpay/fastpayDacuMaintip.vm开始:cashier/fastpay/fastpayDacuMaintip.vm --><!-- CMS:收银台cms/fastpay/fastpayDacuMaintip.vm结束:cashier/fastpay/fastpayDacuMaintip.vm -->
   
      	<input type="hidden" name="_form_token" value="3pAuD58bjBvMD3lYhusI4iW8V6dkH6C1"/>

  <input type="hidden" name="allRemainPayAmount" id="j-allRemainPayAmount" value="395.00" disabled>

  
    <input type="hidden" name="compositeWithBalance" id="j-compositeWithBalance"  value="true" />
<div class="j-balanceChannel row-container  row-container-focus " id="J-balance" data-maxpay="1.92"  data-cid="balance" data-priority="true" data-name="余额"  data-defselect="true" >
  <div class="j-row row-basic">
                <input id="j-balance-box" class="channel-input j-balanceCheck j-row-trigger" type="checkbox" value="true" name="compositeWithMoneyFund" seed="fastpay-balance-input"
            checked
          autocomplete="off"/>
    <label for="j-balance-box" class="channel-label">
              <span class="j-pay-amount pay-amount">
                    支付
                    <em class="amount-font-R16 j-amount-font"> 1.92</em> 元
        </span>
      
      <span class="label-item">
                                      账户余额 &nbsp;
                        <em class="amount-font-G16"> 1.92</em> 元
                                    </span>
                              <a href="javascript:void(0);" class='see-limit  fn-right '  data-arrowposition="5"  data-cashier-tip="J-balance-balance" data-ajax="https://cashierzth.alipay.com:443/tile/service/standard:bankLimit.tile?orderId=06013e54d951caa65b00c78011137740&amp;apiCode=balance&amp;limitScene=fastPayAccountViewModel" seed="balance-see-limit">限额表</a>    
 </label>
  </div>
  <div class="row-extra j-extra fn-hide">
    <div class="j-submitError extra-item fn-hide"></div>
  </div>
</div>
   <div class='row-container ' id="J-moneyFund"  
    data-maxpay="0.52" data-hongbao=""  data-cid="moneyFund" data-defselect="" data-name="余额宝">
    <div class="j-row row-basic">
      <input id="j-moneyFund-box"  style="margin-right:10px;" type="checkbox" autocomplete="off" name="compositeWithMoneyFund" value="true" class="j-row-trigger"
            seed="fastpay-moneyFund-input"/>
      <label  for="j-moneyFund-box" class="channel-label">
        <span id="j-moneyFundIcon" class="moneyFundIcon"></span>

        <span class="label-item">
                                    <strong class="moneyFundTextStyle">余额宝</strong>
              <span id="availableAmount" >
                <strong class="amount-font-G16">1000</strong> 元
              </span>
                                                              <span data-current="showed" class="moneyFund-toggle moneyFund-fastpay" title="隐藏余额宝可支付金额" id="J-toggle-availableAmount"></span>
                                          
                                                                                  </span>
                                      
                                    
        <span class="j-pay-amount pay-amount">
                    支付
                    <em class="amount-font-R16 j-amount-font">0</em> 元
        </span>

                          <a href="javascript:void(0)" class="see-limit fn-right" data-arrowposition="5" data-cashier-tip="J-moneyfund-moneyfund" data-ajax="https://cashierzth.alipay.com:443/tile/service/standard:bankLimit.tile?orderId=06013e54d951caa65b00c78011137740&amp;apiCode=moneyfund&amp;limitScene=fastPayAccountViewModel" seed="money-fund-see-limit">限额表</a>
              </label>
    </div>
    <div class="row-extra j-extra fn-hide">
      <div class="j-submitError extra-item"></div>
    </div>
  </div>

请输入支付宝密码：
<input type="password" name="pwd"><br><br>
&nbsp;
<input  class="checkout_btn3" type="button" value="确认付款" >
<div class="fn-hide">

<!-- CMS:收银台cms/快速付款/白条二期签约协议展开文案结束:fastpay/baitiaoUsedExpTpl.vm --></div><div id="footer">
  <!-- CMS:收银台cms/公用CMS/Footer开始:common/footer.vm --><!-- CMS:全站公共 cms/foot/copyright.vm开始:foot/copyright.vm --><style>
.copyright,.copyright a,.copyright a:hover{color:#808080;}
</style>
<div class="copyright">
      支付宝版权所有 2004-2015 <a href="http://fun.alipay.com/certificate/jyxkz.htm" target="_blank">ICP证：浙B2-20120045</a>
  </div>

<div id="partner">
            <img src="https://i.alipayobjects.com/e/201303/2R3cKfrKqS.png" />
    </div>
</body>
</html>