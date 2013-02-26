$(document).ready(function() {

   $('#timelineblock').BlocksIt({
	numOfCol: 2,
	offsetX: 0,
	offsetY: 5,
	blockElement: 'div'
   });

// generate arrows according to the position generated bu BlocksIt.js
Arrows();
   

// This is a small hack to replace the arrows when the block is hovered
$(".block").hover(function() {
	var posLeft = $(this).css("left");

	if ( posLeft == "0px" ) {
				$(this).children("span#edge").addClass("redge_h");			
			} else 	{
				$(this).children("span#edge").addClass("ledge_h");			
			} 	
	}, function () {
	var posLeft = $(this).css("left");

		if ( posLeft == "0px" ) {
					$(this).children("span#edge").removeClass("redge_h");			
				} else 	{
					$(this).children("span#edge").removeClass("ledge_h");			
				} 
  	});

// function to place the arrows
function Arrows()
	{ 
		var all_blocks = $('#timelineblock').find('.block');

		$.each(all_blocks, function(i, obj){
			var posLeft = $(obj).css("left");

			if ( posLeft == "0px" ) {
				$(obj).css("margin", "0px 0px 20px 65px").css("width", "340px").css("float", "left");
				$(obj).children("span#edge").addClass("redge");			
			} else 	{
				$(obj).css("margin", "0px 0px 20px 18px").css("float","right").css("width", "340px").css("clear","both");
				$(obj).children("span#edge").addClass("ledge");			
			} 		

		});
	}
});

$(".timelineblock li:odd").css("margin", "-10px 0 20px 90px");

$(".timelineblock li:even").css("margin", "-10px 0 20px 90px");

$(".timelineblock li:odd").css("float", "right").css("margin-right", "85px").css("clear", "both");
