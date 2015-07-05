<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<nav class="navbar navbar-default" style="margin-bottom:0px;">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">场景展示</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">客厅<span class="sr-only"></span></a></li>
        <li id="switch"><a href="#">吸顶灯</a></li>
        <li id="switch">
			<div class="switch switch-large" style="margin-top:8px;height:32px;">
			    <input type="checkbox" id="1" checked="checked"/>
			    <input type="hidden" id="hd1" value="on"/>
			</div>
		</li>
        <li id="switch"><a href="#">射灯</a></li>
        <li id="switch">
			<div class="switch switch-large" style="margin-top:8px;height:32px;">
			    <input type="checkbox" id="2" checked="checked"/>
			    <input type="hidden" id="hd2" value="on"/>
			</div>
		</li>
<!--         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">灯光选择<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu" style="width:240px;padding:10px 20px 10px 20px">
            <li>
				<div class="switch" id="fsdafs">
				    顶灯&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="ck1" checked>
				</div>
            </li>
            <li>
				<div class="switch">
				    射灯&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="ck2" checked>
				</div>
			</li>
          </ul>
        </li> -->
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>