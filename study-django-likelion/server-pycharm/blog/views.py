from django.contrib.auth.models import User
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required

from .models import Post, Comment
from .form import PostForm

def admin_page(request):
    return redirect('admin')

@login_required
def index(request):
    posts = Post.objects.all().order_by('-id')
    return render(request, 'index.html', {'posts_show':posts})

def detail(request, post_id):
    post_detail = get_object_or_404(Post, pk=post_id)
    if request.user.is_authenticated:
        user = User.objects.get(username=request.user.get_username())
        return render(request, 'detail.html', {'post':post_detail, 'user':user})
    return render(request, 'detail.html', {'post':post_detail})

def delete(request, post_id):   # remove post
    post = get_object_or_404(Post, pk=post_id)
    post.delete()
    return redirect('index')

def newpost(request, init_content=""):   # write post using post type
    if request.method == "POST":
        form = PostForm(request.POST) # load form
        if form.is_valid(): # check is this form valid
            post = form.save(commit=False) # load without save
            post.author = User.objects.get(username=request.user.get_username())
            post.save()
            return redirect('index')
    else:
        form = PostForm()
        return render(request, 'new.html', {'form':form, 'init_content':init_content})

def editpost(request, post_id):   # edit post using post type
    post = get_object_or_404(Post, pk=post_id)
    if request.method == "POST":
        form = PostForm(request.POST, request.FILES) # load form
        if form.is_valid(): # check is this form valid
            post.title = form.cleaned_data['title']
            post.content = form.cleaned_data['content']
            post.save()
            return redirect('index')
    else:
        form = PostForm(instance=post)
        return render(request, 'modify.html', {'form':form})

def comment_write(request, post_pk):
    if request.method == 'POST':
        post = get_object_or_404(Post, pk=post_pk)
        content = request.POST.get('content')
        conn_profile = User.objects.get(username=request.user.get_username())
        Comment.objects.create(post=post, comment_writer=conn_profile, comment_contents=content)
        return redirect('/blog/' + str(post.id))


'''
def new(request):       # write post method="GET"
    return render(request, 'new.html')

def create(request):    # write post method="GET"
    post = Post()
    post.title = request.GET['title']
    post.content = request.GET['content']
    post.pub_date = timezone.datetime.now()
    post.save()
    return redirect('/post/' + str(post.id))

def modify(request, post_id):   # edit post method="GET"
    post_detail = get_object_or_404(Post, pk=post_id)
    return render(request, 'modify.html', {'post':post_detail})

def update(request, post_id):   # edit post method="GET"
    post = get_object_or_404(Post, pk=post_id)
    post.title = request.GET['title']
    post.content = request.GET['content']
    post.save()
    return redirect('/post/' + str(post.id))
'''