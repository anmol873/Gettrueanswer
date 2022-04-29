
 <%@page import="com.blogs.dao.*"%>
<%@page import="com.blogs.helper.*"%>
<%@page import="com.blogs.entities.*"%>
<%@page import="java.util.ArrayList"%>

<div class="row">
	<%
	PostDao pDao2 = new PostDao(ConnectionProvider.getConnection());
	int cid = 0;
	cid = 0;
	ArrayList<Post> list2 = null;
	if (cid == 0) {
		list2 = pDao2.getPost();
	} else {

	}
	if (list2.isEmpty()) {
	%>
	<div class="container text-center" style="margin: 2vh">
		<h1>No Post Sorry</h1>
	</div>
	<%
	}
	for (Post cc : list2) {
	System.out.println(cc.getpPic());
	%>
	<div class="col-md-4 mt-4 mb-3">
		<div class="card h-600" style="height: 30rem">
			<div class="card-header text-center primary-background">
				<img src="images/<%=cc.getpPic()%>"
					style="width: 300px; height: 200px">
			</div>
			<div class="card-body">
				<h3><%=cc.getTitle()%></h3>
				<p><%=cc.getContent()%></p>
			</div>
			<div class="card-footer text-right primary-background">

				<a href="show_post.jsp?post_id=<%=cc.getPId()%>"
					class="btn btn-outline-light btn-sm">Read more</a><a href="#"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-thumbs-o-up"></i><span>10</span></a> <a href="#"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-commenting-o"></i><span>10</span></a>
			</div>
		</div>
	</div>
	<%
	}
	%>
</div>

<!-- Button trigger modal -->

<%
	String str = request.getParameter("showPost");

%>
<!-- Modal -->
<div class="modal fade" id="showFullBlogs" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
				<h2><%=str%></h2>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function()
	{
		alert("this is an alert");	
			})
</script>