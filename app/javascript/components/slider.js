class Carousel{

    /**
     * @param {HTMLElement} element 
     * @param {Object} options 
     * @param {Object} options.slidesToScroll Scroll pace, number of slides by which we want to scroll
     * @param {Object} options.visibleSlides Nb of slides that should be visible at once
     */
  constructor (element, options = {}) {
      this.element = element;
      this.options = Object.assign({},{
        slidesToScroll: 1,
        visibleSlides: 1
      }, options)
      //Convert Nodelist into array and exclude last item which is being appended by the function. We only want the children at runtime prior to function execution
      let children = [].slice.call(element.children);
      // Replaces : this.children = element.children;
      this.currentSlide = 0;
      this.root = this.createDivWithClass('carousel');
      this.container = this.createDivWithClass('carousel__container');
      this.root.appendChild(this.container);
      this.element.appendChild(this.root);
      this.items = children.map( (child) => {
        let item = this.createDivWithClass('carousel__item');
        item.appendChild(child);
        this.container.appendChild(item);
        return item
      })
      this.setStyle()
      this.createNavigation()
    }
    /**
     * 
     * @param {string} className
     * @returns {HTMLElement} 
     */
    createDivWithClass (className){
      let div = document.createElement('div');
      div.setAttribute('class', className)
      return div;
    }

      /**
       * Applies correct dimensions to the carousel, carousel container and children
       */
    setStyle(){
      let ratio = this.items.length / this.options.visibleSlides;
      this.container.style.width = (ratio * 100) + "%";
      this.items.forEach(item =>  item.style.width = (( 100 / this.options.visibleSlides)/ratio) + "%" )
      console.log(this.items)
    }

    createNavigation(){
      const nextButton = this.createDivWithClass('carousel__next');
      const prevButton = this.createDivWithClass('carousel__prev');
      this.root.appendChild(nextButton);
      this.root.appendChild(prevButton);
      // Bind this to the nextButton
      nextButton.addEventListener('click', this.next.bind(this))
      prevButton.addEventListener('click', this.prev.bind(this))
    }

    next(){
      this.gotoSlide(this.currentSlide + this.options.slidesToScroll)
      console.log(this.currentSlide);
    }

    prev(){
      this.gotoSlide(this.currentSlide - this.options.slidesToScroll)
    }

    gotoSlide(index){
      // Determine the % by which to scroll on the X axis with a 3D translate, negative value to go right.
      const translationX = index * -100/this.items.length
      this.container.style.transform = `translate3d(${translationX}%,0,0)`
      this.currentSlide = index;
    }
  }

  const carouselHolder = document.querySelector('.carousel__panorama');
  if (carouselHolder){
    console.log(carouselHolder);
    new Carousel(carouselHolder, {
      visibleSlides: 3,
      slidesToScroll: 1
    })
  }




