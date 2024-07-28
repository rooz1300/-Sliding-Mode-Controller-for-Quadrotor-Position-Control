# Adaptive Neural Network-Based Sliding Mode Controller for Quadrotor Position Control

## Overview
This repository contains the implementation of an adaptive neural network-based sliding mode controller (SMC) for quadrotor position control. The proposed controller integrates neural networks to adaptively tune the parameters of the sliding mode controller, enhancing robustness and tracking performance.

## System Dynamics
The quadrotor dynamics are modeled with respect to both body and earth coordinate frames. The position and orientation of the quadrotor are represented by vectors in these coordinate frames, and the rotational matrix \( R \) is defined based on roll, pitch, and yaw angles.

### Rotational Matrix
The rotational matrix \( R \) is given by:
\[ R=R(\phi,\theta,\psi)=R(z,\psi)R(y,\theta)R(x,\phi) \]
where:
\[ R(z, \psi)=\left[\begin{array}{ccc}
\cos \psi & -\sin \psi & 0 \\
\sin \psi & \cos \psi & 0 \\
0 & 0 & 1
\end{array}\right] \]
\[ R(y, \theta)=\left[\begin{array}{ccc}
\cos \theta & 0 & \sin \theta \\
0 & 1 & 0 \\
-\sin \theta & 0 & \cos \theta
\end{array}\right] \]
\[ R(x, \phi)=\left[\begin{array}{ccc}
1 & 0 & 0 \\
0 & \cos \phi & -\sin \phi \\
0 & \sin \phi & \cos \phi
\end{array}\right] \]

### Kinematic and Dynamic Equations
The translational and rotational kinematics are derived using the rotational matrix and coordinate transformations. The dynamic equations of motion for the quadrotor are given by:

#### Translational Dynamics
\[ \ddot{x}=\frac{\sin \theta \cos \phi \cos \psi+\sin \phi \sin \psi}{m_s} u_1-\frac{k_1 \dot{x}}{m_s} \]
\[ \ddot{y}=\frac{\sin \theta \cos \phi \sin \psi+\sin \phi \cos \psi}{m_s} u_1-\frac{k_2 \dot{y}}{m_s} \]
\[ \ddot{z}=\frac{\cos \theta \cos \phi}{m_s} u_1-g-\frac{k_3 \dot{z}}{m_s} \]

#### Rotational Dynamics
\[ \ddot{\phi}=\dot{\theta} \dot{\psi} \frac{I_y-I_z}{I_x}+\frac{J_r}{I_x} \dot{\theta} \Omega_r+\frac{l}{I_x} u_2-\frac{k_4 l}{I_x} \dot{\phi} \]
\[ \ddot{\theta}=\dot{\phi} \dot{\psi} \frac{I_z-I_x}{I_y}-\frac{J_r}{I_y} \dot{\phi} \Omega_r+\frac{l}{I_y} u_3-\frac{k_5 l}{I_y} \dot{\theta} \]
\[ \ddot{\psi}=\dot{\theta} \dot{\phi} \frac{I_x-I_y}{I_z}+\frac{c}{I_z} u_4-\frac{k_6}{I_z} \dot{\psi} \]

### Control Inputs
The control inputs \( u_1, u_2, u_3, u_4 \) are defined as:
\[ \left[\begin{array}{c}
u_1 \\
u_2 \\
u_3 \\
u_4
\end{array}\right]=\left[\begin{array}{c}
T \\
M_\phi \\
M_\theta \\
M_\psi
\end{array}\right]=\left[\begin{array}{cccc}
b & b & b & b \\
l b & 0 & -l b & 0 \\
0 & -l b & 0 & l b \\
-k & k & -k & k
\end{array}\right]\left[\begin{array}{c}
\Omega_1^2 \\
\Omega_2^2 \\
\Omega_3^2 \\
\Omega_4^2
\end{array}\right] \]

## Sliding Mode Controller (SMC)
Sliding mode control is employed due to its robustness to uncertainties and disturbances. The SMC is designed for position and attitude control of the quadrotor.

### SMC Control Law
The control law for the SMC is given by:
\[ s_{z}=w_{z}(z_{d}-z)+(\dot{z}_{d}-\dot{z}) \]
\[ \dot{s}_{z}=w_{z}(\dot{z}_{d}-\dot{z})+\ddot{z}_{d}-\frac{\cos\theta\cos\phi}{m_{s}}u_{1}+g \]

### Adaptive Neural Network Tuning
Neural networks are used to adaptively tune the SMC parameters, improving performance and reducing chattering effects. The adaptive laws are derived using gradient descent.

## Simulation Results
Simulation results demonstrate the effectiveness of the proposed controller in tracking desired trajectories. The quadrotor's position and orientation are controlled accurately, even in the presence of disturbances and uncertainties.
