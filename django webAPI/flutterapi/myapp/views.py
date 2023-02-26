from django.shortcuts import render
from django.http import JsonResponse

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
