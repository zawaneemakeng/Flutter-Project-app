from django.shortcuts import render
from django.http import JsonResponse

from rest_framework.response import Response
from rest_framework.decorators import api_view
from  rest_framework import status
from .serializers import TodolistSerializer
from .models import Todolist,Profile
import uuid




# GET Data
@api_view(['GET'])
def all_todolist(request):
    all_todolist = Todolist.objects.all()#select data from table todolist
    serializer = TodolistSerializer(all_todolist,many=True)
    return Response(serializer.data,status=status.HTTP_200_OK)

# POST Data
@api_view(['POST'])
def post_todolist(request):
    if request.method == 'POST':
        serializer = TodolistSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)

# Update Data
@api_view(['PUT'])
def update_todolist(request,TID):
    todo =Todolist.objects.get(id=TID)   
    if request.method == 'PUT': 
        data = {}
        serializer = TodolistSerializer(todo,data = request.data)
        if serializer.is_valid():
            serializer.save()
            data['status']='updated'
            return Response(data=data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)

# DELATE Data
@api_view(['DELETE'])
def delete_todolist(request,TID):
    todo =Todolist.objects.get(id=TID)   
    if request.method =='DELETE':
        delete = todo.delete()
        data = {}
        if delete:
            data['status'] = 'deleted'
            statuscode=status.HTTP_200_OK
        else:
            data["status"] = 'failed'
            statuscode=status.HTTP_404_NOT_FOUND
        return Response(data=data,status=statuscode)
        

# POST Data New User
from django.contrib.auth.models import User

@api_view(['POST'])
def rigister_newuser(request):
    if request.method == 'POST':
        print(request.body)
        print(type(request.data))
        datadict = request.data
        data = request.data
        print("FN :",datadict['first_name'])
        #data = request.POST.copy() ใช้กับเว็บ
        print(data)
        username = data.get('username')
        password = data.get('password')
        first_name = data.get('first_name')
        last_name = data.get('last_name')
        mobile = data.get('mobile')
        print('Check User ',username,password)
        # ตววจสอบว่ามี account ?
        if username == None and password == None:
            dt ={'status':'username and password required'}
            return Response(data=dt,status=status.HTTP_400_BAD_REQUEST)


        check = User.objects.filter(username=username)
        if len(check) == 0:
            newuser = User()
            newuser.username = username
            newuser.set_password(password) #ฟังก์ชั่นการเข้ารหัส 
            newuser.first_name = first_name
            newuser.last_name = last_name
            newuser.save()
            
            newprofile = Profile()
            newprofile.user = User.objects.get(username=username)
            newprofile.mobile = mobile

            gentoken = uuid.uuid1().hex
            newprofile.token = gentoken
            newprofile.save()
            dt = {'status': 'user_created',
                   'token':gentoken,
                   'first_name':first_name,
                   'last_name':last_name,
                   'username':username}
            return Response(data=dt,status=status.HTTP_201_CREATED)
        else :
            dt ={'status':'user-exist'}
            return Response(data=dt,status=status.HTTP_400_BAD_REQUEST)
        

from django.contrib.auth import authenticate,login
@api_view(['POST'])
def authenticate_app(request):
    if request.method == 'POST':
        data = request.data
        username = data.get('username')
        password = data.get('password')
        try:
            user =  authenticate(username=username, password=password)
            login(request,user)
            getuser = User.objects.get(username=username)
            dt = {'status': 'login-success',
                   'token':getuser.profile.token,
                   'first_name':getuser.first_name,
                   'last_name':getuser.last_name,
                   'username':getuser.username}
            print('Success',dt)
            return Response(data=dt,status=status.HTTP_200_OK) 
        except:
            dt = {'status': 'login-failed'}
            print('failed',dt)
            return Response(data=dt,status=status.HTTP_400_BAD_REQUEST) 

   



data = [{
        "title": "บริติช ช็อตแฮร์ (British Shorthair)",
        "subtitle": "British shorthair เป็นหนึ่งในสายพันธุ์แมวที่เก่าแก่ที่สุดของประเทศอังกฤษ",
        "image_url": "https://raw.githubusercontent.com/zawaneemakeng/BasicAPI/main/british.jpg",
        "details": "บริติช ช็อตแฮร์เป็นสายพันธุ์แมวที่ค่อนข้างเงียบ ไม่ค่อยส่งเสียงร้อง สามารถเลี้ยงในคอนโดได้ แต่ที่อยากนำเสนอเป็นพิเศษคือน้องเป็นพันธุ์แมวที่น่ารักและขี้อ้อนมาก ๆ แถมใบหน้ายังกลมใหญ่ดูเป็นไอ้ต้าวอ้วน แต่จริง ๆ แล้วสายพันธุ์ของน้องเป็นสายพันธุ์แมวที่แข็งแรง มีกล้ามเนื้อเยอะเฉย ๆ โดยส่วนใหญ่สีที่คนนิยมเลี้ยงจะเป็นสีเทาหรือสีสวาด แต่คนในวงการแมวจะเรียกว่าสีบลู"
        },
        {
        "title": "สก๊อตทิช โฟลด์ (Scottish fold)",
        "subtitle": "แมวมันช์กิ้น เป็นแมวสายพันธุ์ขนาดกลาง ",
        "image_url": "https://raw.githubusercontent.com/zawaneemakeng/BasicAPI/main/scottish.jpg",
        "details": "หากพูดถึงสายพันธุ์แมวที่เป็นขวัญใจของสาว ๆ ต้องยกให้สก็อตติช โฟลด์เขาเลยล่ะ เรียกได้ว่าเป็นแมวที่น่าทะนุถนอมสุด ๆ เพราะขนาดของนางนั้นมินิเหลือเกิน แถมหน้าตายังบ้องแบ๊วชวนหลงใหล และยังชอบวิ่งสุด ๆ แต่บทจะเงียบก็เงียบจริง ๆ และบอกไว้ก่อนว่าน้องจะอ้อนแค่ตอนหิวเท่านั้น"
        },
        {
        "title": "วิเชียรมาศ (Siamese cat)",
        "subtitle": "แมวพันธุ์วิเชียรมาศ หรือ แมวสยาม (Siamese cat) ที่เป็นดั่งตัวแทนสายพันธุ์แมวแห่งประเทศไทย",
        "image_url": "https://raw.githubusercontent.com/zawaneemakeng/BasicAPI/main/siamese.jpg",
        "details": "มีเอกลักษณ์จากลวดลายและสีขนบนตัวอันงดงามแล้ว ยังมีลักษณะนิสัยที่เป็นมิตร ขี้อ้อน จนสามารถคว้าใจเหล่าบรรดาทาสแมวมาแล้วทั่วโลก"
        },
        {
        "title": "เปอร์เซีย (persian cat)",
        "subtitle": "แมวเปอร์เซียมีนิสัยอ่อนโยน เรียบร้อย และซื่อสัตย์กับเจ้าของมาก",
        "image_url": "https://raw.githubusercontent.com/zawaneemakeng/BasicAPI/main/persian.jpg",
        "details": " พวกเค้าไม่ใช่แค่น่ารักอ่อนหวานเท่านั้น แต่ยังชอบอ้อนขอกอดจนทำให้ทาสแมวต่างก็หลงรักหัวปักหัวปำ แม้ว่าเปอร์เซียจะต้องการความสนใจและการดูแลค่อนข้างมาก แต่โดยรวมพวกเค้าก็เป็นสัตว์เลี้ยงที่ดีเลย"
        },
        {
        "title": "เบงกอล (Bengal)",
        "subtitle": "แมวป่าที่ผสมกับแมวบ้านจนเกิดลวดลายสวยงาม รูปร่างหน้าตาไม่ต่างจากแมวบ้าน ดูไปดูมาเหมือนลูกเสือดาว",
        "image_url": "https://raw.githubusercontent.com/zawaneemakeng/BasicAPI/main/bengal.jpg",
        "details": "แมวเบงกอล เป็นแมวขนาดปานกลางถึงค่อนข้างใหญ่ หัวมีความยาวมากกว่ากว้าง เพราะถูกผสมโดยควบคุมลักษณะให้มีรูปร่างคล้ายแมวป่า เพรียว ยาว เห็นมัดกล้ามเนื้อแบบนักล่าชัดเจน โดยจะมีความสูงส่วนสะโพกสูงกว่าความสูงของช่วงไหล่ หางส่วนมากจะมีปลายชี้ลง ใบหูกลม สั้น ตารูปไข่ (Oval) ช่วงโคนหนวดเด่น ช่วงปากและรอบจมูกกลมกว่าแมวบ้าน จุดที่เด่นที่สุดของแมวเบงกอล ได้แก่ สีขนและมีลายเป็นจุดแบบแมวป่าหรือลายหินอ่อน"
        }]


def Home(request):
    return JsonResponse(data=data, safe=False, json_dumps_params={'ensure_ascii': False})


