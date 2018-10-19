class Carousel{

    /**
     * @param {HTMLElement} element 
     * @param {Object} options 
     * @param {Object} [options.slidesToScroll = 1] Scroll pace, number of slides by which we want to scroll
     * @param {Object} [options.visibleSlides = 2] Nb of slides that should be visible at once
     * @param {boolean} [options.loop = false] Set to true if you want infinite loop
     * @param {boolean} [options.pagination = false] Paginate and jump to slide
     */

  constructor (element, options = {}) {
      this.element = element;
      this.options = Object.assign({},{
        slidesToScroll: 1,
        visibleSlides: 1,
        loop: false,
        pagination: false
      }, options)
      //Convert Nodelist into array and exclude last item which is being appended by the function. We only want the children at runtime prior to function execution
      let children = [].slice.call(element.children);
      // Replaces : this.children = element.children;
      this.currentSlide = 0;
      this.isMobile = false;
      this.root = this.createDivWithClass('carousel');
      this.root.setAttribute('tabIndex', 0);
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
      this.onWindowResize()
      this.createPagination() 
      window.addEventListener('resize', this.onWindowResize.bind(this))
      this.root.addEventListener('keyup', e => {
        if (e.key === "ArrowRight" || e.key === "Right"){
          this.next()
        } else if (e.key === "ArrowLeft" || e.key === "Left"){
          this.prev()
        }
      })
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
      let ratio = this.items.length / this.visibleSlides;
      this.container.style.width = (ratio * 100) + "%";
      this.items.forEach(item =>  item.style.width = (( 100 / this.visibleSlides)/ratio) + "%" )
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
      this.gotoSlide(this.currentSlide + this.slidesToScroll)
      console.log(this.currentSlide);
    }

    prev(){
      this.gotoSlide(this.currentSlide - this.slidesToScroll)
      // Current Slide can be negative
      console.log(this.currentSlide);
    }

    gotoSlide(index){
      // Determine the % by which to scroll on the X axis with a 3D translate, negative value to go right.
      const translationX = index * -100/this.items.length
      // Go back to last slide if clicking on previous from the first
    if (index < 0 ){
      index = this.items.length - this.options.visibleSlides;
    } else if ( index >= this.items.length || this.items[this.currentSlide + this.visibleSlides] === "undefined"){
      index = -1
    }
      this.container.style.transform = `translate3d(${translationX}%,0,0)`
      this.currentSlide = index;
    }

    createPagination(){
      const pagination = this.createDivWithClass('carousel__pagination');
      const buttons= []
      this.root.appendChild(pagination)
      for (let i = 0; i < this.items.length; i = i + this.options.slidesToScroll){
        const button = this.createDivWithClass('carousel__pagination__button')
        button.addEventListener('click', () => { this.gotoSlide(i) })
        button.addEventListener('click', button => button.classList.add('active'))
        pagination.appendChild(button)
        buttons.push(button)
      }
    }
    /**
     * @returns {number}
     */

    get slidesToScroll(){
      return this.isMobile ? 1 : this.options.slidesToScroll
    }

    /** 
     * @returns {number}
     */
    get visibleSlides(){
      return this.isMobile ? 1 : this.options.visibleSlides
    }

    onWindowResize(){
      const mobile = window.outerWidth < 800
      console.log(mobile)
      console.log(window.outerWidth)
      // We bound the this to the Carousel object, hence why we can call this.isMobile here.
      if (mobile !== this.isMobile){
        this.isMobile = mobile
        this.setStyle()
      }
    }

  }

  const carouselHolder = document.querySelector('.carousel__panorama');
  if (carouselHolder){
    console.log(carouselHolder);
    new Carousel(carouselHolder, {
      visibleSlides: 2
    })
  }




