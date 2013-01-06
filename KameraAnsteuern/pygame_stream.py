import pygame
import pygame.camera
from pygame.locals import *
import sys

pygame.init()
pygame.camera.init()

camlist = pygame.camera.list_cameras()
cam = pygame.camera.Camera(camlist[0],(640,480))
#cam = pygame.camera.Camera(camlist[1],(352,288))
cam.start()

screen = pygame.display.set_mode((640,480),pygame.RESIZABLE)
pygame.display.set_caption("pygame video")
while True:
    for event in pygame.event.get():
        if event.type == QUIT or (event.type == KEYDOWN and event.key == K_ESCAPE):
            cam.stop()
            sys.exit()
    img = cam.get_image()
    screen.blit(img,(0,0))
    pygame.display.update()