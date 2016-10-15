<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <title></title>
    <link href="/js/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/scripts/jquery.min.js"></script>
    <script src="/js/uploadify/jquery.uploadify-3.1.js" type="text/javascript"></script>
 <script type="text/javascript">
        $(function () {
            $("#uploadify").uploadify({
                //指定swf文件
                'swf': '/js/uploadify/uploadify.swf',
                //后台处理的页面
                'uploader': '/test/uploadAttach',
                //按钮显示的文字
                'buttonText': '上传图片',
                //显示的高度和宽度，默认 height 30；width 120
                //'height': 15,
                //'width': 80,
                //上传文件的类型  默认为所有文件    'All Files'  ;  '*.*'
                //在浏览窗口底部的文件类型下拉菜单中显示的文本
                'fileTypeDesc': 'Image Files',
                'fileObjName':'attach',
                //允许上传的文件后缀
                'fileTypeExts': '*.*',
                //发送给后台的其他参数通过formData指定
                //'formData': { 'someKey': 'someValue', 'someOtherKey': 1 },
                //上传文件页面中，你想要用来作为文件队列的元素的id, 默认为false  自动生成,  不带#
                //'queueID': 'fileQueue',
                //选择文件后自动上传
                'auto': false,
                //设置为true将允许多文件上传
                'multi': false,
                onUploadSuccess: function (file, data, response) {//上传完成时触发（每个文件触发一次）
                	alert(data);
                },

                'onUploadError': function (file, errorCode, errorMsg, errorString) {//当单个文件上传出错时触发

                    alert('文件：' + file.name + ' 上传失败: ' + errorString);

                }
            });
        });
    
    </script>
</head>
<body>
    <div>
        <div id="fileQueue">
        </div>
        <input type="file" name="attach" id="uploadify" />
        <p>
            <a href="javascript:$('#uploadify').uploadify('upload')">上传</a>| 
            <a href="javascript:$('#uploadify').uploadify('cancel')">取消上传</a>
        </p>
    </div>
</body>
</html>