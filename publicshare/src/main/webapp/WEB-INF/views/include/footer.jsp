<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- footer start  -->	

	<div id="c">
		<div class="container">
			<p>Created by <a href="http://www.blacktie.co">BLACKTIE.CO</a></p>
		
		</div>
	</div>
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/resources/assets/js/classie.js"></script>
    <script src="/resources/assets/js/bootstrap.min.js?ver=1"></script>
    <script src="/resources/assets/js/smoothscroll.js"></script>
	<script src="/resources/assets/js/jquery.stellar.min.js"></script>
	<script src="/resources/assets/js/fancybox/jquery.fancybox.js"></script> 
	<script type="text/javascript">
		$(function(){
			$.stellar({
				horizontalScrolling: false,
				verticalOffset: 40
			});
		});
		$(function() {
		  //    fancybox
		    jQuery(".fancybox").fancybox();
		});
		
		//header 알람 표시를 위한 script
		if(${notice.applycnt + notice.rejectcnt} !== 0){
			$("#myLib").html(${notice.applycnt + notice.returncnt});	
		}
		
		if(${notice.applyreadycnt + notice.rejectcnt} !== 0){
			$("#myLoan").html(${notice.applyreadycnt + notice.rejectcnt});
		}
	</script>
  </body>
  		
</html>
<!-- footer end  -->	
