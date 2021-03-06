# Accessible Vehicle Control Project

###### Max Wenzel and Eli Kopp-Devol

### Goals
* The goal of this project was to simulate the control of a "vehicle" or general method of transportation in a way that is accessible for someone with a dissability while still allowing that person to exersise part of their body. Specifically we wanted to use the flexing of different muscles to send various signals to the "vehicle" so that a person with control of any part of their body could still move about while exersising that part of their body. To do so we used a Myo armband to read EMG signals and mapped an outstretched flexed hand position to an impulse increase in velocity with constant decay. This allowed the user to increase velocity by repeatedly flexing their hand and then allowed them to stop rapidly by "breaking" their wrist (bent 90˚ with fingers pointing down). The rotation of the arm controlls direction of travel. 

### Tools/Libraries
* Processing: A simple visualization of how a vehicle would respond to different inputs

* Myo Connect: To connect the Myo to PC

* Myo Mapper: Feature extraction and packaging of OSC messages to send to Processing


### Feature Extraction
* For this project we were able to use the Myo Mapper, available for free on the Myo website, to perform our feature extraction. The Mapper allows you to pick from a wide range of features to send over OSC, all of which are derived from its three sensors; the accelerometer, gyroscope, and EMG sensors. The features available to send over OSC ranged from just sending the raw data, to a scaled or averaged version of this data, all the way to a first order difference of any of the data. For our project specifically we only used the raw gyroscope data, to access the rotation of armband, and a scaled version of the EMG data to detect hand position/gesture (the raw data was too small for Wekinator to register). 

### ML Algorithms Used/Tested

* Direction
  -Neural Network: We decided to use the Neural Network algorithm as it produced the desired results for controlling direction

* Stop/Go (Classifier)
  - KNN(1): Had 87.23% accuracy
  - KNN(3): Had 85.61% accuracy
  - Boosted Tree: **Had 92.24% accuracy**
  - Decision Tree: Had 86.48% accuracy
  We went with the Boosted Tree algorithm as it produced the most accurate results for classifying the hand positions 


### Possible Improvements
* There a number of possible improvements that could be made to the existing program, the most significant of which allowing for the selection of different modes. There is a lot of data that the Myo band collects which we are not using at all, including pitch and yaw of the armband, as well as many other recognizable hand gestures and acceleration data on any of the previously stated data. Using another hand gesture for instance, the user could be allowed to switch betwee, slow, medium, fast, and reverse speeds or could even control speed using the pitch of the band. It would also be bennificial to dig into the EMG data more to figure out exactly which signals are causing which response so that the noise can be filtered out and the difference between the "stop" gesture and "go" gesture could be better refined.  



### Demo Video
* [Video](https://www.youtube.com/watch?v=1iHmTnbqfYo)
