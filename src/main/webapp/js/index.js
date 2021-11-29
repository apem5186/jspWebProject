'use strict'

// new Swiper(선택자, 옵션)
new Swiper('.notice-line .swiper-container', {
  direction: 'vertical', 
  autoplay: true, 
  loop: true 
})
new Swiper('.promotion .swiper-container', {
  autoplay: { 
    delay: 3000 
  },
  loop: true, 
  slidesPerView: 3, 
  spaceBetween: 10, 
  centeredSlides: true, 
  pagination: { 
    el: '.promotion .swiper-pagination', 
    clickable: true 
  },
  navigation: { 
    prevEl: '.promotion .swiper-prev', 
    nextEl: '.promotion .swiper-next' 
  }
})
new Swiper('.awards .swiper-container', {
  autoplay: true, 
  loop: true, 
  spaceBetween: 30, 
  slidesPerView: 5, 
  navigation: {
    prevEl: '.awards .swiper-prev', 
    nextEl: '.awards .swiper-next' 
  }
})