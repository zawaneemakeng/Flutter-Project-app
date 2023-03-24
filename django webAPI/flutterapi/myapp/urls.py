from django.urls import path
from .views import *

urlpatterns = [
    path('', Home),
    path('api/all-todolist/', all_todolist),
    path('api/post-todolist', post_todolist),
    path('api/update-todolist/<int:TID>', update_todolist),
    path('api/delete-todolist/<int:TID>', delete_todolist),
    path('api/newuser', rigister_newuser),
    path('api/authenticate', authenticate_app),

]
# post req ไม่ต้อง/