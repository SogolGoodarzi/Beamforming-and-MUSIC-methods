# Beamforming-and-MUSIC-methods
In this project, we solve a communication problem that is about a transmitter and a number of receivers located in a way that receives the transmitted signals from different angles. The goal is to find the angles with two methods: Beamforming and MUSIC.

***Problem***

In a receiver we have a vertical array of M = 10 antennas and the distance between each two of them are d = 1m. The receiver changes the received signals to lowpass signals by carrier frequency fc = 150 MHz. We have two sources at two different angles: 10 and 20 degrees. The lowpass time signal of these two sources is as follows:

![image](https://user-images.githubusercontent.com/125180530/228011003-f8e8386b-a4b3-4b08-87eb-4b9bb8b7209f.png)

Consider that the receiver records the combination of the lowpass signal with noise in 1 ms and with sampling frequency fs = 1MHz. Consider the noise to be Gaussian with mean = 0 and variance = 1 and independent from sources. 

***Solution***
* We try to formulate the problem with the syntaxes of blind source separation:

![image](https://user-images.githubusercontent.com/125180530/228011960-037c0b67-9f1d-4c72-8abe-4bc402adf8d3.png)

![image](https://user-images.githubusercontent.com/125180530/228012930-606534a0-0d2e-41c5-b686-885ec039eb04.png)

### Beamforming Method
By having the observation matrix Y we implement SVD transform to reach U_sig and V_sig matrices needed for beamforming. As it's shown in the figure below, the first two eigenvalues are greater than others so we use the first two columns of the U matrix as U_sig.

![image](https://user-images.githubusercontent.com/125180530/228016684-49bf9063-2955-4ca0-a606-1811f0164fce.png)

The cost function in Beamforming can be defined like the below formula:

![image](https://user-images.githubusercontent.com/125180530/228017015-55713706-3d3d-4a6a-9a38-af27ea8b03a4.png)

For plotting the f function we generate a vector for theta that consists of different angles from 0 to 90 degrees and then plot f in the following figure:

![image](https://user-images.githubusercontent.com/125180530/228022223-ffa25c96-dfd6-43a8-92d0-a92ea7434d11.png)

As it's obvious from the above figure the maximum values of f are in two angles: approximately 10 and 20 degrees. So, we can see that the results from the implementation are the same as well:

![image](https://user-images.githubusercontent.com/125180530/228022575-76bd2d15-8c2b-463f-ad83-67e9de3305bc.png)

### MUSIC Method
We do the same process as the Beamforming method but in this case, the cost function is defined by the following formula:

![image](https://user-images.githubusercontent.com/125180530/228022969-eae84b9d-95ae-4584-915c-dd3fa3110acb.png)

For this method, we need to generate U_null. As U_sig was just the first two columns of U, therefore U_null is the complement of U_sig which consists of other columns of U besides the first two columns. After creating the f function we plot it in the same way:

![image](https://user-images.githubusercontent.com/125180530/228023472-2f20d024-76dc-45f8-884c-70c63a2e5d84.png)

The maximum values of the cost function in this method are like the other method:

![image](https://user-images.githubusercontent.com/125180530/228023820-ee2648da-9e47-45fc-8b8e-436d2e04282f.png)

***Conclusion***
The difference between the graphs of the two methods is in the width of graphs near the maximum values. In Beamforming the width is greater than that in the MUSIC method. The reason is that in Beamforming the final vector that is corresponding to f is an N-element vector but in MUSIC it's an (M-N)-element. In MUSIC, the vector a should be orthogonal to the greater number of vectors so, in this case, we have more information and then the width of the graph near maximums is less. In Beamforming the vector a should have components of a less number of vectors. So, the width of the graph is greater in this case. 

![image](https://user-images.githubusercontent.com/125180530/228025758-74e15c90-f4f0-481f-a2ce-bac015fee4f6.png)

* Now consider we know the signal of the source and it is a single-tone signal with the following form:

![image](https://user-images.githubusercontent.com/125180530/228026483-c414e13d-3333-48e8-9e8c-a708c66f329c.png)

Now with the use of the Beamforming method, we want to estimate the source signal's frequency. So, we can write:

![image](https://user-images.githubusercontent.com/125180530/228026835-31612f4f-cd73-4960-962d-0065f5f7b00b.png)

The V_sig matrix is just like U_sig in the first step. It consists of the first two columns of V.

For plotting the F function we generate a vector of different values of frequency. For instance from 1 to 50 KHz. So, the F function is like the following graph:

![image](https://user-images.githubusercontent.com/125180530/228027536-7c1fddd4-997a-47f7-8160-2be689b48452.png)

Now the maximum values of F are located approximately in 1 and 2 KHz and we can see that we reach the same results by implementation:

![image](https://user-images.githubusercontent.com/125180530/228027760-20601236-105d-4bdf-992a-dab6bb5d1108.png)

So, the estimated frequencies of the sources are 1 and 2 KHz with the Beamforming method. 

* Now we do the same process with the MUSIC method:

![image](https://user-images.githubusercontent.com/125180530/228028042-fa85d9dc-5f2d-4788-abe7-21e7556cfc36.png)

V_null is just the other columns of V besides the first two columns. The F function is plotted in the following figure:

![image](https://user-images.githubusercontent.com/125180530/228028871-8bab1daf-b74a-4e4d-acde-66d761e531e3.png)

![image](https://user-images.githubusercontent.com/125180530/228028921-a563273d-e207-4661-bc82-35efbbb4285d.png)

The results reached by this method are the same as those of the Beamforming method. 
