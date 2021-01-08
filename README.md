# Blaze - A Flutter app to detect fire and smoke.
<p>This project was completed by <a href="https://www.linkedin.com/">Harshvardhan raj</a> and <a href="https://reshamas.github.io">Amit kuamr jha</a>.  This article details how to create a web and mobile app for custom object detection.</p>

## Problem Statement:-
To build an Android application that can detect fire and smoke in an image. The image
can be either taken from gallery or capture a new image using camera. Colored bounding box has to
be drawn on the image once the fire or smoke is detected as shown in below image.

## Objectives:-
* To make an object detection model and deploy it on aws ec2.
* To make an flutter app and make an api call from the deployed model for fire and smoke detection.

## Object Detection Overview:-
To explore the concept of object detection it is useful to begin with image classification. Image Classification goes through levels of incremental complexity.
<p><strong>Image classification (1)</strong> aims at assigning an image to one of a number of different categories (e.g. car, dog, cat, human, etc.), essentially answering the question “What is in this picture?”. One image has only one category assigned to it.</p>
<p><strong>Object localization (2)</strong> then allows us to locate our object in the image, so our question changes to “What is it and where it is?”. </p>
<p>In a real real-life scenario, we need to go beyond locating just one object but rather multiple objects in one image. For example, a <strong>self-driving car</strong> has to find the location of other cars, traffic lights, signs, humans and to take appropriate action based on this information.
</p>
<p><strong>Object detection (3)</strong> provides the tools for doing just that –  finding all the objects in an image and drawing the so-called <strong>bounding boxes</strong> around them. There are also some situations where we want to find exact boundaries of our objects in the process called <strong>instance segmentation</strong>, but this is a topic for another post.</p><br><br>
<img width="1000"  src="https://appsilon.com/wp-content/uploads/2018/08/types.png">
## What is YOLO Object Detection?

## Machine Learning powered Android Application
This application can detect objects in any of the three ways:
  * Image choosen from Gallery
  * From image taken within the App
  * Real time in video stream
  
 ## Model is trained using Yolov3-tiny (Object Detection)
  * Link to the collab - https://drive.google.com/file/d/18yJI-dbjb16xbyL5oA2qhLGWAgsTRg_Q/view?usp=sharing
