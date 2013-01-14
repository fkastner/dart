import pygame
import pygame.camera


pygame.init()
pygame.camera.init()

camlist = pygame.camera.list_cameras()
cam = pygame.camera.Camera(camlist[0], (640,480), "RGB")
cam.start()

cam.get_image()
pygame.time.delay(500)
img = cam.get_image()

pygame.image.save(img, "snapshot.png")
print "snapshot taken"
