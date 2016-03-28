$(document).ready(function(){
	var editorFor = "";
	var commentFor = "";
	var editedFor = "";
	var element = "";
	var category = "all";
	var nomore = 0;
	var page = 1;
	var lastSent = 0;
	var validFirstName = 0;
	var validLastName = 0;
	var validEmail = 0;
	var validCollege = 0;
	var validCity = 0;
	var validCountry = 0;
	var validdob = 0;
	var validphonenum = 0;
	var validrollnum = 0;
	var validbranch = 0;
	var singnUpAllOk = 0;
	var toSend = { };
	toSend['source'] = 	"requestArticles";
	toSend['category'] = "all";
	toSend['start'] = "0";
	toSend['lang'] = $("#language option:selected").text();
	$.post("check.jsp", toSend, function(data) {
			$("#article-area").html(data);
			if(toSend['lang'] == "English"){
			}else{
			toTelugu();
			}
	});
	
	
	var selectedLang = $("#language option:selected").text();
	   if(selectedLang == "English"){
	   		toEnglish();
	   }else{
	   		toTelugu();
	   }
			
	$('textarea.tinymce').tinymce({
			// Location of TinyMCE script
			script_url : 'tiny_mce/tiny_mce.js',

			// General options
			theme : "advanced",
			plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

			// Theme options
			theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
			theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true,

			// Drop lists for link/image/media/template dialogs
			template_external_list_url : "lists/template_list.js",
			external_link_list_url : "lists/link_list.js",
			external_image_list_url : "lists/image_list.js",
			media_external_list_url : "lists/media_list.js",

			// Replace values for the template plugin
			template_replace_values : {
				username : "Some User",
				staffid : "991234"
			}
		});
	
	
	$("#language").change(function(){
	   var selectedLang = $("#language option:selected").text();
	   if(selectedLang == "English"){
	   		toEnglish();
	   }else{
	   		toTelugu();
	   }
	});
	$(".vmenu").click(function(){
		lastSent = 0;
		var lmoption = $(this).text();
		$("#singup-form").hide();
		$("#article-area").show();
		$("#create-article-area").hide();
		$("#my-article-area").hide();
		$("#my-settings-area").hide()
		$("#article-area").show();
		$(".vmenu").removeClass("vactive");
		$(".hmenu").removeClass("hactive");
		$(this).addClass("vactive");
		$("#va").addClass("hactive");
		category = $(this).attr("name");
		
		var toSend = { };
		toSend['source'] = 	"requestArticles";
		toSend['category'] = $(this).attr("name");
		toSend['start'] = "0";
		toSend['lang'] = $("#language option:selected").text();
		$.post("check.jsp", toSend, function(data) {
				$("#article-area").html(data);
		 if(toSend['lang'] == "English"){
			}else{
			toTelugu();
		}
		});
		
	});
	
	$(".hmenu").click(function(){		
		var mmoption = $(this).attr('name');
		//alert(mmoption);
		$("#singup-form").hide();
		$("#css_horizontal_menu").show();
		$("#article-area").show();
		if(mmoption == "va"){
			$("#article-area").show();
			$("#create-article-area").hide();
			$("#my-article-area").hide();
			$("#my-settings-area").hide();
			$("#moderator-area").hide();
			$("#admin-area").hide();
			$("#stats-area").hide();
			var toSend = { };
			toSend['source'] = 	"requestArticles";
			toSend['category'] = "all";
			toSend['start'] = "0";
			toSend['lang'] = $("#language option:selected").text();
			$.post("check.jsp", toSend, function(data) {
				$("#article-area").html(data);
				if(toSend['lang'] == "English"){
			}else{
			toTelugu();
		}
			});
			$(".vmenu").removeClass("vactive");
			$("#all").addClass("vactive");
		}else if(mmoption == "ca"){
			$("#article-area").hide();
			$("#create-article-area").show();
			$("#my-article-area").hide();
			$("#my-settings-area").hide();
			$("#moderator-area").hide();
			$("#admin-area").hide();
			$("#stats-area").hide();
			$(".vmenu").removeClass("vactive");
		}else if(mmoption == "ma"){
			$("#article-area").hide();
			$("#create-article-area").hide();
			$("#my-article-area").show();
			$("#my-settings-area").hide();
			var toSend = { };
			toSend['source'] = 	"requestArticles";
			toSend['category'] = "myArticles";
			toSend['start'] = "0";
			toSend['lang'] = $("#language option:selected").text();
			$.post("check.jsp", toSend, function(data) {
				$("#my-article-area").html(data);
				if(toSend['lang'] == "English"){
				}else{
				toTelugu();
			}
			});
			if(toSend['lang'] == "English"){
			}else{
			toTelugu();
			}
			$("#moderator-area").hide();
			$("#admin-area").hide();
			$("#stats-area").hide();			
		}else if(mmoption == "ms"){
			$("#article-area").hide();
			$("#create-article-area").hide();
			$("#my-article-area").hide();
			$("#my-settings-area").show();
			$("#moderator-area").hide();
			$("#admin-area").hide();
			$("#stats-area").hide();
			$(".vmenu").removeClass("vactive");
		}else if(mmoption == "mo"){
			$("#article-area").hide();
			$("#create-article-area").hide();
			$("#my-article-area").hide();
			$("#my-settings-area").hide();
			$("#moderator-area").show();
			$("#admin-area").hide();
			$("#stats-area").hide();
			$(".vmenu").removeClass("vactive");
		}else if(mmoption == "ad"){
			$("#article-area").hide();
			$("#create-article-area").hide();
			$("#my-article-area").hide();
			$("#my-settings-area").hide();
			$("#moderator-area").hide();
			$("#admin-area").show();
			$("#stats-area").hide();
			$(".vmenu").removeClass("vactive");
		}else if(mmoption == "st"){
			$("#article-area").hide();
			$("#create-article-area").hide();
			$("#my-article-area").hide();
			$("#my-settings-area").hide();
			$("#moderator-area").hide();
			$("#admin-area").hide();
			$("#stats-area").show();
			$(".vmenu").removeClass("vactive");
		}
		$(".hmenu").removeClass("hactive");
		$(this).addClass("hactive");
	});
	

	
	$("#forget-password").click(function(){
		$(".forget-password-panel").show();	
	});
	
	
	$("#create-article-button").click(function(){
		//$("#article-area").hide();
		$("#article-editor").show();
		$("#create-article-heading").show();
		$("#comment-article-heading").hide();
		$("#finish-editing").show();
		$('#editor').html("");
		editorFor = "article";	
	});
	
	
	$("#signup").click(function(){
		$("#singup-form").show();
		$("#css_horizontal_menu").hide();
		$("#article-area").hide();
	});

	$("#search-article").click(function(){
		var toSend = { };
		toSend['source'] = 'requestArticles';
		toSend['keyword'] = $("#keyword").val();
		toSend['category'] = "searchArticle";
		toSend['start'] = "0";
		
		//alert(toSend['keyword']);
		var emptyfields = 0;
	    for(var x in toSend){
	     if(toSend[x] == "")
	     {
	     	emptyfields++;
	     }
	    }
		
		if(emptyfields > 0){
			$(".fberrorbox").hide();
			$(".fberrorbox").html("Not Keyword entered");
			$(".fberrorbox").show();
			$('.fberrorbox').fadeOut(3000, function() {});	
		}
		else{
			$("#article-area").show();
			$("#create-article-area").hide();
			$("#my-article-area").hide();
			$("#my-settings-area").hide();
			$("#moderator-area").hide();
			$("#admin-area").hide();
			$(".vmenu").removeClass("vactive");
      		$.post("check.jsp", toSend, function(data) {
      			/*var keywordtoreplace = toSend['keyword'];
				var regExp = new RegExp(keywordtoreplace,'igm');
				var highLigthedData = data.replace(regExp,'<b>'+ keywordtoreplace +'</b>');
				$("#article-area").html(highLigthedData);			*/
				$("#article-area").html(data);
			});
			
			}			
	});	
	

	$("#signin").click(function(){
		var toSend = { };
		toSend['source'] = 'signin';
		toSend['login-email'] = $("#login-email").val();
		toSend['login-password'] = $("#login-password").val();
	
		var emptyfields = 0;
	    for(var x in toSend){
	     if(toSend[x] == "")
	     {
	     	emptyfields++;
	     }
	    }
		
		if(emptyfields > 0){
			$(".fberrorbox").hide();
			$(".fberrorbox").html("Enter Username and Password");
			$(".fberrorbox").show();
			$('.fberrorbox').fadeOut(3000, function() {});	
		}
		else{
      		$.post("check.jsp", toSend, function(data) {
				window.location.reload(true);							
			});
			
			}			
	});	
	
	$("#signout").click(function(){
		$("#css_horizontal_menu").hide();
		$("#before-login").show();
		$("#after-login").hide();
		$("#article-editor").hide();
		$("#article-area").show();
		
		var toSend = { };
		toSend['source'] = 'signout';
		
		$.post("check.jsp", toSend, function(data) {
			$(".fbinfobox").hide();
			$(".fbinfobox").html("Your are successfully logged out");
			$(".fbinfobox").show();
			$('.fbinfobox').fadeOut(3000, function() {});
			$('.tick').each(function(){
				$(this).removeClass('tick');
				$(this).addClass('nontick');
			});
			$('.comment').each(function(){
				$(this).removeClass('comment');
				$(this).addClass('noncomment');
			});		
		});	
		window.location.reload(true);
	});
	
	$('#logo').click(function(){
		window.location.reload(true);
	});
	
	$("#signup-cancel").click(function(){
			$("#singup-form").hide();
			$("#article-area").show();	
	});
	
	
	$("#finish-editing").click(function(){
		
		//alert(editorFor);	
		
		var toSend = { };
		
		if(editorFor == "article"){	
		var fullName = $("#article-type option:selected").text();
		if(fullName == "CSIT"){
			toSend['article_type'] = 'cs';
		}
		else if(fullName == "ECE"){
			toSend['article_type'] = 'ec';
		}
		else if(fullName == "EEE"){
			toSend['article_type'] = 'ee';
		}
		else if(fullName == "MECH"){
			toSend['article_type'] = 'me';
		}
		else if(fullName == "CIVIL"){
			toSend['article_type'] = 'ci';
		}
		else if(fullName == "CHEM"){
			toSend['article_type'] = 'ch';
		}
		else if(fullName == "CURRENTAFFAIRS"){
			toSend['article_type'] = 'ca';
		}
		else if(fullName == "GK"){
			toSend['article_type'] = 'gk';
		}
		else if(fullName == "SPORTS"){
			toSend['article_type'] = 'sp';
		}
		else if(fullName == "MANAGEMENT"){
			toSend['article_type'] = 'ms';
		}
		else if(fullName == "CULTURALS"){
			toSend['article_type'] = 'cl';
		}
		else if(fullName == "OTHERS"){
			toSend['article_type'] = 'ot';
		}
		
		toSend['article_type'] = fullName;
		
		toSend['source'] = 'postArticle';
		toSend['article_title'] = $("#article-title").val();
		toSend['article_content'] = $("#editor").html();
	
	}
	
	if(editorFor == "editArticle"){		
		toSend['source'] = 'editArticle';
		toSend['articleId'] = editedFor;
		toSend['newcontent'] = $("#editor").html();	
		
		$.post("check.jsp", toSend, function(data) {
			$(".fbinfobox").hide();
				$(".fbinfobox").html(data);
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});	
			});
	}
	if(editorFor == "comment"){
		
		toSend['source'] = 'postComment';
		toSend['commentfor_article'] = commentFor;
		toSend['comment_content'] = $("#editor").html();
		$("#comments-"+commentFor).prepend("<div style = 'background-color: #D4DAE8;color: black;width: 100%;padding : 1px;margin-top: 1px;' >"+toSend['comment_content']+" By Me</div>");
		var count = Number(element.attr("count")) ;
		count = count + 1;
		element.attr("count",count);
		element.html("<img class='commenticon' src='images/commenticon.jpg'/> Comments "+ count);
		toSend['lang'] = $("#language option:selected").text();
		if(toSend['lang'] == "English"){
		}else{
			element.html("<img class='commenticon' src='images/commenticon.jpg'/> కామె౦ట్ "+ element.attr('count'));
		}		
	}
		var emptyfields = 0;
	    for(var x in toSend){
	     if(toSend[x] == "")
	     {
	     	emptyfields++;
	     }
	    }
		
		if(emptyfields > 0){
			$(".fberrorbox").hide();
			$(".fberrorbox").html("Some Fields are empty");
			$(".fberrorbox").show();
			$('.fberrorbox').fadeOut(3000, function() {});
		
		}
		else{
      		$.post("check.jsp", toSend, function(data) {
				//alert(data);
				$("#article-editor").hide();			
				$(".fbinfobox").hide();
				//$(".fbinfobox").html("Your article is successfully posted");
				$(".fbinfobox").html(data);
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});				
			});
			}			
	});
	
	$("#cancel-editing").click(function(){
		$("#article-editor").hide();
	});
	
	$("#first_name").focusout(function(){
		if($(this).val() == ""){
			$("#val_fn").html("<div class='validate-error'>Cannot be empty</div>");
			validFirstName = 0;
		}else{
			$("#val_fn").html("");
			validFirstName = 1;
		}
	});
	$("#last_name").focusout(function(){
		if($(this).val() == ""){
			$("#val_ln").html("<div class='validate-error'>Cannot be empty</div>");
			validLastName = 0;
		}else{
			$("#val_ln").html("");
			validLastName = 1;
		}
	});
	$("#email").focusout(function(){
		var email = document.getElementById('emailaddress');
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if($(this).val() == ""){
			$("#val_email").html("<div class='validate-error'>Cannot be empty</div>");
			validEmail = 0;
		}else if(filter.test($(this).val()))  {
			validEmail = 1;
			var toSend = { };
			toSend['source'] = 'validateEmail';
			toSend['email'] =  $(this).val();
      		$.post("check.jsp", toSend, function(data) {
      			$("#val_email").html(data);
		});
		}else{
			$("#val_email").html("<div class='validate-error'>Not a valid email address</div>");
		}
	});
	
	$("#college").focusout(function(){
		if($(this).val() == ""){
			$("#val_college").html("<div class='validate-error'>Cannot be empty</div>");	
			validCollege = 0;
		}else{
			$("#val_college").html("");
			validCollege = 1;
		}
	});
	$("#city").focusout(function(){
		if($(this).val() == ""){
				$("#val_city").html("<div class='validate-error'>Cannot be empty</div>");
				validCity = 0;
		}else{
			$("#val_city").html("");
			validCity = 1;
		}
	});
	$("#country").focusout(function(){
		if($(this).val() == ""){
			$("#val_country").html("<div class='validate-error'>Cannot be empty</div>");
			validCountry = 0;
		}else{
			validCountry = 1;
			$("#val_country").html("");
		}
	});
	$("#dob").focusout(function(){
		var email = document.getElementById('emailaddress');
		var filter = /^\d{4}[\-](0?[1-9]|1[012])[\-](0?[1-9]|[12][0-9]|3[01])$/; 
		if($(this).val() == ""){
				$("#val_dob").html("<div class='validate-error'>Cannot be empty</div>");
				validdob = 0;
		}else if(filter.test($(this).val())) {
			$("#val_dob").html("<div class='validate-success'>Valid Date</div>");
			validdob = 1;
		}else {
			$("#val_dob").html("<div class='validate-error'>Invalid Date Enter as yyyy-mm-dd </div>");
			validdob = 0;
		}
	});
	$("#phno").focusout(function(){
		if($(this).val() == ""){
				$("#val_phno").html("<div class='validate-error'>Cannot be empty</div>");
				validphonenum = 0;
		}else{
			validphonenum = 1;
			$("#val_phno").html("");
		}
	});
	$("#rollno").focusout(function(){
	
		if($(this).val() == ""){
			validrollnum = 0;
			$("#val_rollno").html("<div class='validate-error'>Cannot be empty</div>");
	}else {
			validrollnum = 1;
			var toSend = { };
			toSend['source'] = 'validateRoll';
			toSend['roll'] =  $(this).val();
      		$.post("check.jsp", toSend, function(data) {
      			$("#val_rollno").html(data);
		});
	}
	});
	$("#branch").focusout(function(){
		if($(this).val() == ""){
			validbranch = 0;
			$("#val_branch").html("<div class='validate-error'>Cannot be empty</div>");
		}else{
			validbranch = 1;
			$("#val_branch").html("");
		}
	});
	
	$("#send-moderator-request").click(function(){
		var toSend = { };
		toSend['source'] = 'sendModeratorRequest';
		toSend['request_subject'] =  $("#request-subject option:selected").text();
      	$.post("check.jsp", toSend, function(data) {
			$(".fbinfobox").hide();
			$(".fbinfobox").html(data);
			$(".fbinfobox").show();
			$('.fbinfobox').fadeOut(3000, function() {});
		});	
		
	});
	
	
	$("#chage-password-commit").click(function(){
		
		var toSend = { };
		toSend['source'] = 'chagePassword';
		toSend['old_password'] = $("#change-pwd-oldpwd").val();
		toSend['new_password'] = $("#change-pwd-newpwd").val();
		toSend['rnew_password'] = $("#change-pwd-rnewpwd").val();
	 
		var emptyfields = 0;
	    for(var x in toSend){
	     if(toSend[x] == "")
	     {
	     	emptyfields++;
	     }
	    }
		
		if(toSend['new_password'] != toSend['rnew_password'])
		{
			$(".fberrorbox").hide();
			$(".fberrorbox").html("Passwords doesnt match");
			$(".fberrorbox").show();
			$('.fberrorbox').fadeOut(3000, function() {});
		}
		
		if(emptyfields > 0){
			$(".fberrorbox").hide();
			$(".fberrorbox").html("Some Fields are empty");
			$(".fberrorbox").show();
			$('.fberrorbox').fadeOut(3000, function() {});
			
		}else{
      			$.post("check.jsp", toSend, function(data) {
				$(".fbinfobox").hide();
				$(".fbinfobox").html(data);
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});
			});	
		}
		
	});
	
	
	$("body").delegate("#publish-thought-of-the-day","click",function(){
  			var toSend = { };
			toSend['source'] = 'thoughtOfTheDay';
			toSend['thought'] = $("#thought-of-the-day").val();
			if(toSend['thought'] != ""){
  				$.post("check.jsp", toSend, function(data) {
				$(".fbinfobox").hide();
				$(".fbinfobox").html(data);
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});
				});
			}else{
				$(".fberrorbox").hide();
				$(".fberrorbox").html("No Thought entered");
				$(".fberrorbox").show();
				$('.fberrorbox').fadeOut(3000, function() {});
			}						
	});
	
	
	$("body").delegate("#publish-word-of-the-day","click",function(){
  			var toSend = { };
			toSend['source'] = 'wordOfTheDay';
			toSend['word'] = $("#word-of-the-day").val();
			if(toSend['word'] != ""){
  				$.post("check.jsp", toSend, function(data) {
				$(".fbinfobox").hide();
				$(".fbinfobox").html(data);
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});
				});
			}else{
				$(".fberrorbox").hide();
				$(".fberrorbox").html("No word entered");
				$(".fberrorbox").show();
				$('.fberrorbox').fadeOut(3000, function() {});
			}						
	});
	
	$("body").delegate("#submit-college-news","click",function(){
  			var toSend = { };
			toSend['source'] = 'postCollegeNews';
			toSend['news'] = $("#college-news").val();
			if(toSend['news'] != ""){
  				$.post("check.jsp", toSend, function(data) {
				$(".fbinfobox").hide();
				$(".fbinfobox").html(data);
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});
				});
			}else{
				$(".fberrorbox").hide();
				$(".fberrorbox").html("No News entered");
				$(".fberrorbox").show();
				$('.fberrorbox').fadeOut(3000, function() {});
			}						
	});
	
	
	$("body").delegate(".comments-heading","click",function(){
  			var clickedOn = $(this).attr("article");
  			if($("#comments-"+clickedOn).html() != "")
  			{
  				$("#comments-"+clickedOn).toggle();
  			}else{ 
  			var toSend = { };
			toSend['source'] = 'getAllComments';
			toSend['articleId'] = clickedOn;
  			$.post("check.jsp", toSend, function(data) {
				$("#comments-"+clickedOn).html(data);			
			});	
			}
	});
		
	$("#update-profile-info").click(function(){
		var toSend = { };
		toSend['source'] = 'updateProfile';
		toSend['update_first_name'] = $("#update_first_name").val();
		toSend['update_last_name'] = $("#update_last_name").val();
	    toSend['update_city'] = $("#update_city").val();
	    toSend['update_phno'] = $("#update_phno").val();
		var emptyfields = 0;
	    for(var x in toSend){
	     if(toSend[x] == "")
	     {
	     	emptyfields++;
	     }
	    }
		
		if(emptyfields > 0){
			$(".fberrorbox").hide();
			$(".fberrorbox").html("Some Fields are empty");
			$(".fberrorbox").show();
			$('.fberrorbox').fadeOut(3000, function() {});
			
		}else{
      			$.post("check.jsp", toSend, function(data) {
				$(".fbinfobox").hide();
				$(".fbinfobox").html(data);
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});
				});	
		}
	});	
		
	$("#signup-save").click(function(){
		var toSend = { };
		toSend['source'] = 'signup';
		toSend['first_name'] = $("#first_name").val();
		toSend['last_name'] = $("#last_name").val();
		toSend['email'] = $("#email").val();
	    toSend['college'] = $("#college").val();
	    toSend['city'] = $("#city").val();
	    toSend['country'] = $("#country").val();
	    toSend['dob'] = $("#dob").val();
	    toSend['phno'] = $("#phno").val();
	    toSend['rollno'] = $("#rollno").val();
	    toSend['branch'] = $("#branch").val();
	    toSend['gender'] = $("#gender option:selected").text();
	    toSend['role'] = $("#role option:selected").text();
	
		var emptyfields = 0;
	    for(var x in toSend){
	     if(toSend[x] == "")
	     {
	     	emptyfields++;
	     }
	    }
		if(validCity == 1 && validCollege == 1 && validFirstName == 1 && validCountry == 1 && validEmail == 1 && validLastName == 1 && validbranch == 1 && validdob == 1 && validphonenum == 1 && validrollnum == 1){
			singnUpAllOk = 1;	
		}else{
			singnUpAllOk = 0;
		}
		if(emptyfields > 0 || singnUpAllOk == 0){ 
			$(".fberrorbox").hide();
			$(".fberrorbox").html("Some Fields are empty or invalid");
			$(".fberrorbox").show();
			$('.fberrorbox').fadeOut(3000, function() {});
			
		}else{
      			$.post("check.jsp", toSend, function(data) {
				//alert(data);
				$("#singup-form").hide();
				$("#article-area").show();
				$(".fbinfobox").hide();
				$(".fbinfobox").html("Your are successfully Signed up. A confirmation email will be send");
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});
			});	
		}
	});
		
		
	$("#user-report").click(function(){
		window.open('http://localhost:9080/sample/UsersReport.jsp');
	});
	
	$("#moderator-report").click(function(){
		window.open('http://localhost:9080/sample/ModeratorsReport.jsp');
	});
	
	$("#polls-report").click(function(){
		window.open('http://localhost:9080/sample/PollReport.jsp');
	});	
	
	$("body").delegate("#add-option","click",function(){
		$('#add-option').remove();
		$('#publish-poll').remove();
  		$('#create-new-panel').append("<br/><div style='padding:2px;'>Poll Option : <input class='poll-option' type='text' size='20'/> <input id='add-option' type='button' size='30' value='Add Option'/> <input id='publish-poll' type='button' size='30' value='Publish Poll'/></div>");
	});
		
	$("body").delegate("#publish-poll","click",function(){
		var toSend = { };
		var pollOptionCount = 1;
		toSend['source'] = 'publishPoll';
		toSend['poll-question'] = $("#poll-question").val();
		
		$('.poll-option').each(function(){
			toSend['poll-option-'+pollOptionCount] = $(this).val();
			pollOptionCount++;
		});
		
		toSend['option-count'] = pollOptionCount;
	
		var emptyfields = 0;
	    for(var x in toSend){
	     if(toSend[x] == "")
	     {
	     	emptyfields++;
	     }
	    }
		
		if(emptyfields > 0){
			$(".fberrorbox").hide();
			$(".fberrorbox").html("Some Fields are Empty");
			$(".fberrorbox").show();
			$('.fberrorbox').fadeOut(3000, function() {});	
		}
		else{
      		$.post("check.jsp", toSend, function(data) {
				$(".fbinfobox").hide();
				$(".fbinfobox").html(data);
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});						
			});
			
			}			
	});
		
		
	$("body").delegate("#forget-password-submit","click",function(){
  		
  		toSend['source'] = 'forgetPassword';
		toSend['email'] = $("#forget-password-email").val();
		
		var emptyfields = 0;
	    for(var x in toSend){
	     if(toSend[x] == "")
	     {
	     	emptyfields++;
	     }
	    }
		
		if(emptyfields > 0){
			$(".fberrorbox").hide();
			$(".fberrorbox").html("Email Field left Empty");
			$(".fberrorbox").show();
			$('.fberrorbox').fadeOut(3000, function() {});	
		}
		else{
      		$.post("check.jsp", toSend, function(data) {
				$(".fbinfobox").hide();
				$(".fbinfobox").html(data);
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});						
				$('.forget-password-panel').hide();
			});
		}
	});
	
	$("body").delegate("#create-new-poll","click",function(){
  		$('#create-new-panel').append("<br/><div style='padding:2px;'>Poll Question : <input id='poll-question' type='text' size='30'/></div>");
  		$('#create-new-panel').append("<br/><div style='padding:2px;'>Poll Option : <input class='poll-option' type='text' size='20'/> <input id='add-option' type='button' size='30' value='Add Option'/> <input id='publish-poll' type='button' size='30' value='Publish Poll'/></div>");
	});	
			
	
	$("body").delegate("#accept-article-request","click",function(){
  		toSend['source'] = "acceptArticleRequest";
		toSend['articleId'] = $(this).attr("article");
		$.post("check.jsp", toSend, function(data) {
		});
		$('#article-request-'+toSend['articleId']).remove();
	});
	
	
	$("body").delegate("#view-profile","mouseenter",function(e){
  		toSend['source'] = "viewProfile";
		toSend['userId'] = $(this).attr("userid");
		$(".view-profile-panel").show();
		$(".view-profile-panel").offset({left:e.pageX,top:e.pageY});
		$.post("check.jsp", toSend, function(data) {
			$(".view-profile-panel").html(data);
		});
	});
	
	
	$("body").delegate("#view-profile","mouseout",function(){
  		$(".view-profile-panel").hide();
	});
	
	$("body").delegate("#reject-article-request","click",function(){
  		toSend['source'] = "rejectArticleRequest";
		toSend['articleId'] = $(this).attr("article");
		$.post("check.jsp", toSend, function(data) {
		});
		$('#article-request-'+toSend['articleId']).remove();
	});
	
	$("body").delegate("#show-article-request","click",function(){
  		toSend['source'] = "showArticleRequest";
		toSend['articleId'] = $(this).attr("article");
		$("#article-editor").show();
		$("#finish-editing").hide();
		$.post("check.jsp", toSend, function(data) {
			$('#editor').html(data);
		});
	});
	
	
	$("body").delegate("#accept-moderator-request","click",function(){
  		toSend['source'] = "acceptModeratorRequest";
		toSend['requestId'] = $(this).attr("request");
		$.post("check.jsp", toSend, function(data) {
			element.html(data);
		});
		$('#request-'+toSend['requestId']).remove();
	});
	
	
	$("body").delegate("#reject-moderator-request","click",function(){
		toSend['source'] = "rejectModeratorRequest";
		toSend['requestId'] = $(this).attr("request");
		$.post("check.jsp", toSend, function(data) {
			element.html(data);
		});
		//alert(toSend['requestId']);
		$('#request-'+toSend['requestId']).remove();
	});
			
	$("body").delegate(".tick","click",function(){
  		var updatedTick = "tick++";
  		var toSend = { };
  		element = $(this);
		toSend['source'] = "tick";
		toSend['articleId'] = $(this).attr("article");
		toSend['lang'] = $("#language option:selected").text();
		$.post("check.jsp", toSend, function(data) {
			element.html(data);
			var ticksBefore = Number(element.attr("count")) + 1;
			element.attr("count",ticksBefore);
			if(toSend['lang'] == "English"){
			}else{
				element.html("<img class='tickicon' src='images/tickicon.jpg'/> టిక్ "+ element.attr('count'));
			}	
		});
	});
	
	$("body").delegate(".delete","click",function(){
  		var toSend = { };
  		element = $(this);
		toSend['source'] = "deleteArticle";
		toSend['articleId'] = $(this).attr("article");
		$.post("check.jsp", toSend, function(data) {
			$('.article-holder#'+toSend['articleId']).hide();
			$(".fbinfobox").hide();
				$(".fbinfobox").html(data);
				$(".fbinfobox").show();
				$('.fbinfobox').fadeOut(3000, function() {});	
			});
	});
	
	$("body").delegate(".edit","click",function(){
  		var toSend = { };
		editorFor = "editArticle";
		toSend['source'] = "showArticleRequest";
		toSend['articleId'] = $(this).attr("article");
		editedFor = $(this).attr("article");
		$("#article-editor").show();
		$("#finish-editing").show();
		$.post("check.jsp", toSend, function(data) {
			$('#editor').html(data);
		});
	});
	
	$("body").delegate(".download","click",function(){
  		var toSend = { };
  		element = $(this);
		toSend['source'] = "download";
		toSend['articleId'] = $(this).attr("article");
		toSend['lang'] = $("#language option:selected").text();
		$.post("check.jsp", toSend, function(data) {
			element.html(data);
			var downloadsBefore = Number(element.attr("count")) + 1;
			element.attr("count",downloadsBefore);
			if(toSend['lang'] == "English"){
				element.html("<img class='downloadicon' src='images/downloadicon.jpg'/>  Download " + element.attr('count'));
			}else{
				element.html("<img class='downloadicon' src='images/downloadicon.jpg'/>  డౌన్ లొడ్ " + element.attr('count'));
			}
			window.open('http://localhost:9080/sample/articles/'+ toSend['articleId'] + '.pdf');
		});
	});
	
	$("body").delegate(".simplelook","click",function(){
		var articleId  = $(this).attr("article");
		window.open('http://localhost:9080/sample/article.jsp?id='+ articleId);
	});
	
	$("body").delegate(".vote","click",function(){
  		var updatedVote = "vote++";
  		var optionNumber = $(this).attr("option");
  		var toSend = { };
  		element = $(this);
  		
		toSend['source'] = "vote";
		toSend['pollOption'] = $(this).attr("option");
		toSend['pollId'] = $(this).attr("poll");
		toSend['votes'] = $(this).attr("votes");
		$.post("check.jsp", toSend, function(data) {
			element.html(optionNumber + ". " + data);
		});
	});

		
	$("body").delegate(".comment","click",function(){
  		//$("#article-area").hide();
		$("#my-settings-area").hide();
		$("#article-editor").show();
		$("#create-article-heading").hide();		
		$('#editor').html("");
		editorFor = "comment";	
		commentFor = $(this).attr("article");
		element = $(this);
	});
	
	$("body").delegate(".download","click",function(){
  		//alert($(this).attr("article") );
	});
	
	$("body").delegate(".see-more","click",function(){
  		var seeMoreOf = $(this).attr("article");
  		var toSend = { };
			toSend['source'] = 'seeMore';
			toSend['articleId'] = seeMoreOf;
  			$.post("check.jsp", toSend, function(data) {
				$("#article-view-content-"+seeMoreOf).html(data);			
				$("#see-more-"+seeMoreOf).hide();
		});	
	});
	
	$("#get-report").click(function(){
		var toSend = { };
		toSend['source'] = 'getReports';
		toSend['type'] = $("#request-report-type option:selected").text();
  		toSend['period'] = $("#request-report-between option:selected").text();
  		toSend['sdate'] = $("#start-date").val();
  		toSend['edate'] = $("#end-date").val();
  		$.post("check.jsp", toSend, function(data) {
			$("#report-area").html(data);
		});			
	});	
		
	$("#request-report-between").change(function(){
	   var periodOption = $("#request-report-between option:selected").text();
	   if(periodOption == "On")
	   {
	  	$('#end-date').hide(); 	
	   }
	   if(periodOption == "Between")
	   {
	  	$('#end-date').show(); 	
	   }
	  });
	  
	$("body").delegate(".book-look","click",function(){
  		var bookLookOf = $(this).attr("article");
  		$(".book-look-area").show();
  		var page = $("#article-view-content-"+bookLookOf).html();
  		var contentToWriteOnBook = "article-view-content-"+bookLookOf + " p";
  		var paraCount = 1;
  		var freshPage = "";
  		var freshBook = "<div>notebook logo and article details may appear here</div>";
  		$("#"+contentToWriteOnBook ).each(function(){
  			//alert($(this).html());
  			freshPage += "<p>"+$(this).html()+"</p>";
  			if(paraCount % 15 == 0)
  			{	
				freshBook += "<div>"+ freshPage +"</div>";
				freshPage = "";
  			}
  			paraCount++;
  		});
  		freshBook += "<div>"+ freshPage +"</div>";
  		 //alert(freshBook);
  		$('.b-load').html(freshBook);
  		$('#mybook').booklet({
  			arrows: true,
        	arrowsHide: true,
	        width:  900,
	        height: 500
	    });
	});
	
	$(document).keypress(function(e) { 
    	if(e.which == 0){
    		$(".book-look-area").hide();
    		$(".forget-password-panel").hide();
    	}
	});

	$(window).scroll(function(){
		nomore = $("#no-more-articles").length;
		var height = 0;
		var lastArticle = 0;
		$(".article-holder").each(function(){
			height = height + $(this).height();
			lastArticle = $(this).attr('id');
		});
		console.log(lastArticle +","+$(document).scrollTop() +","+ height);
		
        if(nomore == 0 && height - $(document).scrollTop() < 1500 && lastSent != lastArticle ){
          	var start = $(".article-holder").length;
          	var toSend = { };
			toSend['source'] = 	"requestArticles";
			toSend['category'] = category;
			toSend['start'] = lastArticle;
			lastSent = lastArticle;
			$.post("check.jsp", toSend, function(data) {
			$("#article-area").append(data);
		});
		console.log("data to be loaded");
       }
       nomore = $("#no-more-articles").length
       if(nomore > 1){
       	$("#no-more-articles").remove();
       		//$("#article-area").append("No More articles");
       }
	});
	
});

function toEnglish(){
	$('#all').html("<img class='image-icon' src='images/all.jpg'></img>  All");
	$('#cs').html("<img class='image-icon' src='images/cs.jpg'></img>  Computer Science");
	$('#ec').html("<img class='image-icon' src='images/ec.jpg'></img>  Electronics");
	$('#ee').html("<img class='image-icon' src='images/ee.jpg'></img>  Electrical");
	$('#me').html("<img class='image-icon' src='images/me.jpg'></img>  Mechanical");
	$('#ci').html("<img class='image-icon' src='images/ci.jpg'></img>  Civil");
	$('#ch').html("<img class='image-icon' src='images/ch.jpg'></img>  Chemical");
	$('#ca').html("<img class='image-icon' src='images/ca.jpg'></img>  Current Affairs");
	$('#gk').html("<img class='image-icon' src='images/gk.jpg'></img>  General Knowledge");
	$('#sp').html("<img class='image-icon' src='images/sp.jpg'></img>  Sports");
	$('#ms').html("<img class='image-icon' src='images/ms.jpg'></img>  Management Studies");
	$('#cl').html("<img class='image-icon' src='images/cl.jpg'></img>  Cultural");
	$('#ot').html("<img class='image-icon' src='images/ot.jpg'></img>  Others");
	$('#mt').html("<img class='image-icon' src='images/tick.jpg'></img>  Most Ticked");
	$('#md').html("<img class='image-icon' src='images/dw.jpg'></img>  Most Downloaded");
	
	$('#va').html("View Articles");
	$('#ca.hmenu').html("Create Article");
	$('#ma').html("My Articles");
	$('#ms.hmenu').html("My Settings");
	$('#mo').html("Moderator");
	$('#ad').html("Admin");
	$('#st').html("Stats");
	
	$('#email-lab').html("Email");
	$('#password-lab').html("Password");
	$('#forget-password').html("Forget password");
	$('#signin').val("SignIn");
	$('#signup').val("SignUp");
	$('#signout').val("SignOut");
	$('#thoughtoftheday-heading').html("Thought of the day:");
	$('#wordoftheday-heading').html("Word of the Day:");
	$('#search-article-heading').html('Search Article');
	$('#search-article').val("Search");
	$('#poll-heading').html('Poll:');
	$('#news-heading').html('College News:');
	
	$('.see-more').html('See More');
	$('#forget-email-label').html('Enter your Email:');
	$('#forget-password-submit').val('Submit');
	$('.tick').each(function(){
		var Count = $(this).attr('count');
		$(this).html("<img src='images/tickicon.jpg' class='commenticon'> Tick "+ Count);
	});
	$('.comment').each(function(){
		var Count = $(this).attr('count');
		$(this).html("<img src='images/commenticon.jpg' class='commenticon'> Comment "+Count);
	});
	$('.nontick').each(function(){
		var Count = $(this).attr('count');
		$(this).html("<img src='images/tickicon.jpg' class='commenticon'> Tick "+ Count);
	});



	$('.noncomment').each(function(){
		var Count = $(this).attr('count');
		$(this).html("<img src='images/commenticon.jpg' class='commenticon'> Comment "+Count);
	});
	$('.download').each(function(){
		var Count = $(this).attr('count');
		$(this).html("<img src='images/downloadicon.jpg' class='downloadicon'> Download "+ Count);
	});
	$('.book-look').each(function(){
		$(this).html("<img src='images/booklookicon.jpg' class='booklookicon'> BookLook ");
	});
	$('.simplelook').each(function(){
		$(this).html("<img src='images/simplelookicon.jpg' class='simplelookicon'> SimpleLook ");
	});
	
	$('.comments-heading').each(function(){
		$(this).html("Comments");
	});
	
	$('#published-by-data').each(function(){
		$(this).html("published by");
	});	
	
}
function toTelugu(){
	$('#all').html("<img class='image-icon' src='images/all.jpg'></img> అన్ని స౦చికలు");
	$('#cs').html("<img class='image-icon' src='images/cs.jpg'></img> క౦ప్యుటర్స్");
	$('#ec').html("<img class='image-icon' src='images/ec.jpg'></img> ఎలక్ట్రానిక్స్");
	$('#ee').html("<img class='image-icon' src='images/ee.jpg'></img> ఎలక్ట్రికల్");
	$('#me').html("<img class='image-icon' src='images/me.jpg'></img> మెకానికల్");
	$('#ci').html("<img class='image-icon' src='images/ci.jpg'></img> సివిల్");
	$('#ch').html("<img class='image-icon' src='images/ch.jpg'></img> కెమికల్");
	$('#ca').html("<img class='image-icon' src='images/ca.jpg'></img> కరె౦ట్ ఎఫైర్స్");
	$('#gk').html("<img class='image-icon' src='images/gk.jpg'></img> జెనరల్ నాలెడ్జ్");
	$('#sp').html("<img class='image-icon' src='images/sp.jpg'></img> ఆటలు");
	$('#ms').html("<img class='image-icon' src='images/ms.jpg'></img> మెనెజమెన్ట్ స్టడిస్");
	$('#cl').html("<img class='image-icon' src='images/cl.jpg'></img> స౦స్క్రుతి");
	$('#ot').html("<img class='image-icon' src='images/ot.jpg'></img> మిగిలనివి");
	$('#mt').html("<img class='image-icon' src='images/tick.jpg'></img> అధిక టిక్కులు");	
	$('#md').html("<img class='image-icon' src='images/dw.jpg'></img> అధిక డవ్నొడ్స్");
	
	$('#va').html("స౦చికలు చూడు");
	$('#ca.hmenu').html("కొత్త స౦చిక");
	$('#ma').html("నా స౦చికలు");
	$('#ms.hmenu').html("సెట్టి౦గులు");
	$('#mo').html("మొడరెటర్");
	$('#ad').html("ఎడ్మిన్");
	$('#st').html("స్టెట్స్");
	
	$('#email-lab').html("ఈ మెయిల్");
	$('#password-lab').html("పాస్వర్డ్");
	$('#forget-password').html("పాస్వర్డ్ మరిచిథిని");
	$('#signin').val("సయిన్ ఎన్");
	$('#signup').val("సయిన్ అప్");
	$('#signout').val("సయిన్ అవుట్");
	$('#thoughtoftheday-heading').html("ఈ రొజు మ౦చి మాట");
	$('#wordoftheday-heading').html("ఈ రొజు పధ౦");
	$('#search-article-heading').html('స౦చిక వెతుకు');
	$('#search-article').val("వెతుకు");
	$('#poll-heading').html('ఫొల్:');
	$('#news-heading').html('కళాశాల వార్తలు:');
	
	$('.see-more').html('ఇ౦కా చూడు');
	$('#forget-email-label').html('ఈ మెయిల్ వ్రాయు:');
	$('#forget-password-submit').val('సరె');
	$('.tick').each(function(){
		var Count = $(this).attr('count');
		$(this).html("<img src='images/tickicon.jpg' class='commenticon'> టిక్ "+ Count);
	});
	$('.comment').each(function(){
		var Count = $(this).attr('count');
		$(this).html("<img src='images/commenticon.jpg' class='commenticon'> కామె౦ట్ "+Count);
	});
	
	$('.nontick').each(function(){
		var Count = $(this).attr('count');
		$(this).html("<img src='images/tickicon.jpg' class='commenticon'> టిక్ "+ Count);
	});
	$('.noncomment').each(function(){
		var Count = $(this).attr('count');
		$(this).html("<img src='images/commenticon.jpg' class='commenticon'> కామె౦ట్ "+Count);
	});
	
	$('.download').each(function(){
		var Count = $(this).attr('count');
		$(this).html("<img src='images/downloadicon.jpg' class='downloadicon'> డౌన్ లొడ్ "+ Count);
	});
	$('.book-look').each(function(){
		$(this).html("<img src='images/booklookicon.jpg' class='booklookicon'> బుక్ లుక్ ");
	});
	$('.simplelook').each(function(){
		$(this).html("<img src='images/simplelookicon.jpg' class='simplelookicon'> సి౦పల్ లుక్ ");
	});
	
	$('.comments-heading').each(function(){
		$(this).html("కామె౦ట్స్");
	});
	$('#published-by-data').each(function(){
		$(this).html("ప్రచురి౦చనది");
	});
	
	
}
