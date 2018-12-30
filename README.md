# Google_Dino_AI
<div align="center">
  <img src="https://github.com/lgonz041/Google_Dino_AI/blob/master/icon.png"><br><br>
</div>

Neural_Net + Genetic Algorithm = &lt;3 

Winter break 2018 project 

## The Neural Network 
**3 Inputs** 

1. X coordinate position of next obstacle.  Normalized by dividing the Maximum posible distance

2. Realative velocity of obstacles. Normalized by dividing by 10 time the initial value. 

3. Constant, random range (-1,1).

**1 Hidden Layer**

The hidden layer has 3 nodes and use the **tanh** as the activation function.

**2 Outputs** 

The outputs use the **tanh** activation function. Therefore, that ouput ranges from (-1,1).
One output corresponses to small jump and the other corresponse to big jump. The largest output is selected. But in order to activate the jump the value must be greater then zero. 

## Genetic Algorithm 
