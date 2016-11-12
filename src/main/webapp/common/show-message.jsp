<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<script type="text/javascript">
			var code = '${code}';
			if(code!=0){
				print_s("${desc}",function(){history.go(-1);});
			}
		</script>	