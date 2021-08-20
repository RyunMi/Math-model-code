#程序文件Pex20_1.py
import cv2
img=cv2.imread("Lena.bmp")
cv2.imshow('image',img)#'image'为名字
cv2.waitKey(1000)#等待（单位为毫秒）
cv2.imwrite('Lena.jpg',img)