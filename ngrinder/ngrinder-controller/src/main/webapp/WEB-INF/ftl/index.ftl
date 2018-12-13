<!DOCTYPE html>
<html>
	<head>
		<#include "common/common.ftl">
		<title><@spring.message "home.title"/></title>
		<style>
			.wrap {
				height: 470px;
			}
			.hero-unit {
				background-image: url('${req.getContextPath()}/img/bg_main_banner_en.png?${nGrinderVersion}');
				margin-bottom: 10px;
				height: 160px;
				padding: 0;
				margin-top: 0;
			}
			.quick-start {
				padding-left: 160px;
				padding-top: 35px
			}
			.table {
				margin-bottom: 5px
			}
			.container .well {
				margin-top:0px;
			}
            .popover {
                width: auto;
                min-width: 200px;
                max-width: 600px;
                max-height: 500px;
            }
		</style>
	</head>
	<body>
	<div id="wrap">
	<#include "common/navigator.ftl">
	<div class="container wrap">
		<div class="hero-unit" data-step="1" data-intro="<@spring.message 'intro.index.quick.start'/>"/>
			<form class="form-inline" name="quickStart" id="quick_start" action="${req.getContextPath()}/perftest/quickstart" method="POST">
				<div class="quick-start" data-original-title="<@spring.message "home.tip.url.title"/>" data-content="<@spring.message "home.tip.url.content"/>" data-placement="bottom" rel="popover">
					<input type="text" name="url" id="url" class="span6 url_ex required" placeholder="<@spring.message code="home.placeholder.url"/>" data-step="2" data-intro="<@spring.message 'intro.index.test.url'/>"/>
					<select class="select-item span2" id="script_type" name="scriptType"  data-step="3" data-intro="<@spring.message 'intro.index.select.language'/>">
						<#list handlers as handler>
							<option value="${handler.key}">${handler.title}</option>
						</#list>
					</select>
					<button id="start_test_btn" class="btn btn-primary" data-step="4" data-intro="<@spring.message 'intro.index.create'/>"><@spring.message "home.button.startTest"/></button>
				</div>
			</form>
		</div>

	</div>
	</div>
	<#include "common/copyright.ftl">

    <script>
		$(document).ready(function(){
			$.validator.addMethod('url_ex',
				    function (value) {
						return /^((https?|ftp):\/\/)?(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|(([\[]{1})([\da-fA-F]{1,4}:){7}[\da-fA-F]{1,4}([\]]{1}))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(value);
					}, '');

			$("#start_test_btn").click(function() {
				var $url = $("#url");
				if ($url.valid()) {
					var urlValue = $url.val();
					if (!urlValue.match("^(http|ftp)")) {
						$url.val("http://" + urlValue);
					}
					$("#quick_start").submit();
					return true;
				}
				return false;
			});

			$("#quick_start").validate({
				errorPlacement: function(error, element) {
	            	$("div.quick-start").popover("show");
				}
			});

		    $("#url").change(function() {
		    	if ($(this).valid()) {
		    		$("div.quick-start").popover("hide");
		    	}
			});

			$("#introButton").click(function() {
				introJs().start();
			});
		});
	</script>
	</body>
</html>
