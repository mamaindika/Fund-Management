
  <div class="container">
<div class="row"><h1>Bootstrap Tree Menu Example</h1></div>
</div>

<div class="row">
  <div class="span3">
    <div class="well">
        <div>
            <ul class="nav nav-list">
                <li><label class="tree-toggle nav-header">Bootstrap</label>
                    <ul class="nav nav-list tree">
                        <li><a href="#">JavaScript</a></li>
                        <li><a href="#">CSS</a></li>
                        <li><label class="tree-toggle nav-header">Buttons</label>
                            <ul class="nav nav-list tree">
                                <li><a href="#">Colors</a></li>
                                <li><a href="#">Sizes</a></li>
                                <li><label class="tree-toggle nav-header">Forms</label>
                                    <ul class="nav nav-list tree">
                                        <li><a href="#">Horizontal</a></li>
                                        <li><a href="#">Vertical</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="divider"></li>
                <li><label class="tree-toggle nav-header">Responsive</label>
                    <ul class="nav nav-list tree">
                        <li><a href="#">Overview</a></li>
                        <li><a href="#">CSS</a></li>
                        <li><label class="tree-toggle nav-header">Media Queries</label>
                            <ul class="nav nav-list tree">
                                <li><a href="#">Text</a></li>
                                <li><a href="#">Images</a></li>
                                <li><label class="tree-toggle nav-header">Mobile Devices</label>
                                    <ul class="nav nav-list tree">
                                        <li><a href="#">iPhone</a></li>
                                        <li><a href="#">Samsung</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><label class="tree-toggle nav-header">Coding</label>
                            <ul class="nav nav-list tree">
                           <li style="text-align: left; padding-left:5px"><a href="changepassword.jsp">Password Change</a></li>
                        <li style="text-align: left; padding-left:5px"><a href="updateuser.jsp">User Data Modify</a></li>

                                <li><label class="tree-toggle nav-header">HTML DOM</label>
                                    <ul class="nav nav-list tree">
                                        <li><a href="#">DOM Elements</a></li>
                                        <li><a href="#">Recursive</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    </div>
</div>
<script>
$('.tree-toggle').click(function () {
	$(this).parent().children('ul.tree').toggle(200);
});
$(function(){
$('.tree-toggle').parent().children('ul.tree').toggle(50);
})
</script>
