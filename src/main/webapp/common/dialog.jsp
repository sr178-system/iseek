<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 模态框（Modal）对话框 -->
<div class="modal fade" id="prompt-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:245px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">信息</h4>
            </div>
            <div class="modal-body">手机号码不能为空！</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>                
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script>
   function print_s(msg,e){
	   
		 $('#prompt-dialog').on('hidden.bs.modal', function () {
		      if(e){
		    	  e();
		      }
		      });
	   $(".modal-body").text(msg)
       $('#prompt-dialog').modal('show');
   }

</script>
<script type="text/javascript">
			var code = '${code}';
			if(code==201){
				print_s("${desc}",function(){});
			}
			if(code!=0&&code!=2000&&code!=201){
				print_s("${desc}",function(){history.go(-1);});
			}
</script>