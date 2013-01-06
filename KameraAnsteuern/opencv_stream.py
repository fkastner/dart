import pygame
import Image
from pygame.locals import *
import sys

import cv
#this is important for capturing/displaying images
#from opencv import highgui 

def get_image(camera):
    im = cv.QueryFrame(camera)
    # Add the line below if you need it (Ubuntu 8.04+)
    im = cv.GetMat(im)
    ##convert Ipl image to PIL image
    #pi = Image.fromstring("L", cv.GetSize(im), im.tostring())
    #return pi

    #convert Ipl image to pygame surface
    im_rgb = cv.CreateMat(im.height, im.width, cv.CV_8UC3)
    cv.CvtColor(im, im_rgb, cv.CV_BGR2RGB)
    pg_img = pygame.image.frombuffer(im_rgb.tostring(), cv.GetSize(im_rgb), "RGB")
    return pg_img

camera = cv.CreateCameraCapture(1)

fps = 1000.0
pygame.init()
window = pygame.display.set_mode((640,480))
pygame.display.set_caption("WebCam Demo")
screen = pygame.display.get_surface()

while True:
    for event in pygame.event.get():
        if event.type == QUIT or (event.type == KEYDOWN and event.key == K_ESCAPE):
            sys.exit(0)
    im = get_image(camera)
    #pg_img = pygame.image.frombuffer(im.tostring(), im.size, im.mode)
    screen.blit(im, (0,0))
    pygame.display.flip()
    pygame.time.delay(int(1000 * 1.0/fps))