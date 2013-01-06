import pygame
import pygame.camera
from pygame.locals import *
import sys

pygame.init()
pygame.camera.init()

camlist = pygame.camera.list_cameras()
cam = pygame.camera.Camera(camlist[0], (640,480), "HSV")
cam.start()

cam.get_image()
pygame.time.delay(1000)
img = cam.get_image()

pygame.image.save(img, "snapshot_hsv.png")
print "snapshot taken"