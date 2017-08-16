<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<header id ="layout-header">
	<div class="clearfix container">
		
		<a href="${s:mvcUrl('HC#index').build() } id="logo"></a>
	
		<div id="header-content">
			
			<nav id="main-nav">
			
				<ul class="nav nav-pills">
				<li role="presentation" class="active"><a href="${s:mvcUrl('HC#index').build() } ">Home</a></li>
  				<li role="presentation"><a href="#">Profile</a></li>
  				<li role="presentation"><a href="#">Messages</a></li>
				</ul>
			
			</nav>
		
		</div>
	</div>
</header>