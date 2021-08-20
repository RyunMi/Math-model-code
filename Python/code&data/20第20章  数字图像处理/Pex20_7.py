#程序文件Pex20_7.py
from PIL import Image
a=Image.new("RGB",(640,480),(50,50,100,0))  #创建新图像:RGB为图片的模式（mode），（640，480）为图片尺寸，（50,50,100）为图片颜色 
a.save("figure20_7.jpg")  #保存图像
a.show()  #显示图像
