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
<p><strong>Object detection (3)</strong> provides the tools for doing just that –  finding all the objects in an image and drawing the so-called <strong>bounding boxes</strong> around them. There are also some situations where we want to find exact boundaries of our objects in the process called <strong>instance segmentation</strong>, but this is a topic for another post.</p>

***

<img width="700"  src="https://appsilon.com/wp-content/uploads/2018/08/types.png">

***

## YOLO Algorithm
There are a few different algorithms for object detection and they can be split into two groups:-
* Algorithms based on classification. They are implemented in two stages. First, they select regions of interest in an image. Second, they classify these regions using convolutional neural networks. This solution can be slow because we have to run predictions for every selected region. A widely known example of this type of algorithm is the Region-based convolutional neural network (RCNN) and its cousins Fast-RCNN, Faster-RCNN and the latest addition to the family: Mask-RCNN. Another example is RetinaNet.
* Algorithms based on regression – instead of selecting interesting parts of an image, they predict classes and bounding boxes for the whole image in one run of the algorithm. The two best known examples from this group are the YOLO (You Only Look Once) family algorithms and SSD (Single Shot Multibox Detector). They are commonly used for  real-time object detection as, in general, they trade a bit of accuracy for large improvements in speed.
<p>To understand the YOLO algorithm, it is necessary to establish what is actually being predicted. Ultimately, we aim to predict a class of an object and the bounding box specifying object location. Each bounding box can be described using four descriptors:-</p><br>
* center of a bounding box (bxby)
* width (bw)
* height (bh)
* value cis corresponding to a class of an object (such as: car, traffic lights, etc.).

## What is YOLO Object Detection?

## Machine Learning powered Android Application
This application can detect objects in any of the three ways:
  * Image choosen from Gallery
  * From image taken within the App
  * Real time in video stream
  
 ## Model is trained using Yolov3-tiny (Object Detection)
  * Link to the collab - https://drive.google.com/file/d/18yJI-dbjb16xbyL5oA2qhLGWAgsTRg_Q/view?usp=sharing
