import sys

import cv
import pygame
import pygame.camera


#initialize everything
pygame.init()
pygame.camera.init()
use_opencv = False
#set which video device to use
if len(sys.argv) > 1:
	cam_to_use = int(sys.argv[1])
else:
	try:
		cam_to_use = int(input("Which video device should be used: "))
	except EOFError:
		cam_to_use = 0

#construct the window in which the stream will be displayed
window = pygame.display.set_mode((1280,720),pygame.RESIZABLE)
pygame.display.set_caption("/dev/video"+str(cam_to_use))

#start the camera - maybe pygame doesn't support the format used by camera => use OpenCV
try:
	camlist = pygame.camera.list_cameras()
	cam = pygame.camera.Camera(camlist[cam_to_use],(1280,720))
	cam.start()
except SystemError as e:
	cam = cv.CreateCameraCapture(cam_to_use)
	use_opencv = True

#set up stream
while True:
	#exit program if window is closed or escape key is pressed
	for event in pygame.event.get():
		if event.type == pygame.QUIT or (event.type == pygame.KEYDOWN and event.key == pygame.K_ESCAPE):
			#stop the cam if using pygame
			if not use_opencv:
				cam.stop()
			sys.exit()

	if use_opencv:
		#get image from camera
		cv_img = cv.QueryFrame(cam)
		cv_img = cv.GetMat(cv_img)
		#convert OpenCV to pygame surface
		cv_img_rgb = cv.CreateMat(cv_img.height, cv_img.width, cv.CV_8UC3)
		cv.CvtColor(cv_img, cv_img_rgb, cv.CV_BGR2RGB)
		img = pygame.image.frombuffer(cv_img_rgb.tostring(), cv.GetSize(cv_img_rgb), "RGB")
	else:
		img = cam.get_image()

    #display current image
	window.blit(img,(0,0))
	pygame.display.update()