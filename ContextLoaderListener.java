package com.springtutorials.homecontroller;

public class ContextLoaderListener extends org.springframework.web.context.ContextLoaderListener
{
   

    public ContextLoaderListener()
    {
       System.out.println("Application is starting up");
    }
}