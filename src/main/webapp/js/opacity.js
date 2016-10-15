//获取元素ID
function getId ( id ) {
	return document.getElementById(id);
}

//获取元素样式（除行间样式之外的css样式，但必须在css里有定义才可以获取得到）
function getStyle ( obj,attr ){
	return obj.currentStyle ? obj.currentStyle[attr] : getComputedStyle(obj)[attr];
}

//元素移动
function doMove ( obj,attr,n,target,endFn ) {
	clearInterval(obj.timer);	
	
	n = parseInt(getStyle( obj,attr )) < target ? n : -n;
	
	obj.timer = setInterval( function() {		
		var speed = parseInt(getStyle( obj,attr )) + n;		
		if ( speed > target && n>0 || speed < target && n<0 ) {				
			speed = target;
		}		
		obj.style[attr] =  speed + 'px';		
		if( speed == target ){			
			clearInterval(obj.timer);
			endFn && endFn();
		}
	} ,20 );
}

//元素抖动
function shake ( obj,attr,endFn ) {
	var arrNum = [];
	var num=0;
	
	for ( var i=20; i>0; i-=2 ) {
		arrNum.push(i,-i);
	}
	arrNum.push(0);	
		
	clearInterval(obj.timer);
	obj.timer = setInterval( function() {
		//alert(getStyle( oImg,'left' ));  //弹出100px  需要转化成number
		obj.style.left = parseInt(getStyle( obj,attr )) + arrNum[num] + 'px';		
		num++;
		if ( num == arrNum.length ) {
			clearInterval(obj.timer);
			endFn && endFn();
		}
	},100);
}

//元素透明度
function opacity( obj,n,target,endFn ) {
		
	//alert(getStyle(oImg,'opacity')); //17行对于理解至关重要，IE和主流浏览器对透明度的样式虽然不同[ opacity:0.8; filter:alpha(opacity:80); ]但是对于这一行代码的执行弹出值却是一样的，全部为：0.8  所以，当主流浏览器改变了opacity的值之后，IE下乘以100即也是改变后的值，这里不需要再进行运算。
	
	n = getStyle( obj,'opacity' ) * 100 < target ? n : -n;   //这一行必须在定时器上边，而不能在定时器里。
	
	clearInterval(obj.opacity);
	obj.opacity = setInterval(function () {
		
		var  speed = getStyle(obj,'opacity')*100 + n;
		if ( speed < target && n < 0 || speed > target && n >0  ) {
			speed = target;
		}		
		
		obj.style.filter = 'alpha(opacity:'+ speed +')';
		obj.style.opacity = speed/100;			

		if( speed == target) {
			clearInterval(obj.opacity);
			endFn && endFn();
		}
		
	},100)
			
}