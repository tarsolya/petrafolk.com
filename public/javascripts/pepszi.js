/* 
  petrafolk.com
  js libz
  
  Petra Fölk (c) 2010
  
  Created by András Tarsoly on 2010-04-02.
  Copyright 2010 XPN Industries. All rights reserved.
*/ 

$(function() {

  // come on let's scroll again!
  $(".scroll").scrollable({
    globalNav: false,
    size: 1,
    next: 'a.next',
    prev: 'a.previous',
    circular: false
  });
  
  $(".colorbox").colorbox({
    opacity: 0.3
  });
  
});
