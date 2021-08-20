#程序文件Pex20_18.py
import qrcode
qr=qrcode.QRCode(
    version=1, #二维码的尺寸大小，取值范围为1-4021×21，version每增加1，生成的二维码尺寸就会增加4
    #例如，version是2，则生成25×25矩阵的二维码。
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    #参数error_correction指定二维码的容错系数,分别有以下4个系数
    #（1）ERROR_CORRECT_L：7%的字节码可被容错。
    #（2）ERROR_CORRECT_M：15%的字节码可被容错。
    #（3）ERROR_CORRECT_Q：25%的字节码可被容错。
    #（4）ERROR_CORRECT_H：30%的字节码可被容错。
    box_size=10,  #二维码里每个格子的像素大小
    border=5  #边框的格子厚度，默认是4
)
qr.add_data("https://www.python.org/")  #设置二维码数据，
qr.make(fit=True)  #启用二维码颜色设置
img=qr.make_image(fill_color="green", back_color="white")
img.show(); img.save("figure20_17.png")  #显示并保存二维码
