class Carousel{
      /**
     * This callback type is called `requestCallback` and is displayed as a global symbol.
     *
     * @callback moveCallback
     * @param {number} index
     */
    /**
     * 
     * @param {HTMLElement} element 
     * @param {Object} options 
     * @param {Object} [options.slidesToScroll = 1] Scroll pace, number of slides by which we want to scroll
     * @param {Object} [options.visibleSlides = 2] Nb of slides that should be visible at once
     * @param {boolean} [options.loop = false] Set to true if you want to go back to the 1st slide
     * @param {boolean} [options.pagination = false] Paginate and jump to slide
     * @param {boolean} [options.infinite = false] Set to true if slides should appear to be infinite
     */

  constructor (element, options = {}) {
      this.element = element
      this.options = Object.assign({},{
        slidesToScroll: 1,
        visibleSlides: 1,
        loop: false,
        pagination: false,
        containWidth: false,
        containSliderWidth: false,
        infinite: false,
        overflow: "hidden"
      }, options)
      if (this.options.loop && this.options.infinite) {
        throw new Error('Un carousel ne peut être à la fois en boucle et en infinie')
      }
      //Convert Nodelist into array and exclude last item which is being appended by the function. We only want the children at runtime prior to function execution
      let children = [].slice.call(element.children)
      // Replaces : this.children = element.children
      this.currentSlide = 0
      this.moveCallbacks = []
      this.isMobile = false
      this.root = this.createDivWithClass('carousel')
      this.container = this.createDivWithClass('carousel__container')
      this.root.appendChild(this.container)
      this.element.appendChild(this.root)
      this.items = children.map( (child) => {
        const index = children.indexOf(child)
        let item = this.createDivWithClass("carousel__item")
        item.setAttribute('id', index)
        item.appendChild(child)
        return item
      })
      if(this.options.infinite){
        this.offset = this.options.visibleSlides * 2
        this.items = [
          ...this.items.slice(this.items.length - this.offset ).map(item=> item.cloneNode(true)),
          ...this.items,
          ...this.items.slice(0, this.offset).map(item=> item.cloneNode(true))
        ]
        console.log(this.items)
        this.gotoSlide(this.offset, false)
      }
      this.items.forEach( item => this.container.appendChild(item))
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
      if (this.options.infinite) {
        this.container.addEventListener('transitionend', this.resetInfinite.bind(this))
      }
    }
    /**
     * 
     * @param {string} className
     * @returns {HTMLElement} 
     */
    createDivWithClass (className){
      let div = document.createElement('div')
      div.setAttribute('class', className)
      return div
    }

      /**
       * Applies correct dimensions to the carousel, carousel container and children
       */
    setStyle(){
      let ratio = this.items.length / this.visibleSlides
      this.container.style.width = this.options.containWidth ? "100%" : (ratio * 100) + "%"
      if(this.options.overflow === "hidden"){
        this.container.style.overflow = "hidden"
      }
      this.container.style
      this.items.forEach(item =>  item.style.width = this.options.containSliderWidth ? "100%" : (( 100 / this.visibleSlides)/ratio) + "%" )
    }

    createNavigation(){
      const nextButton = this.createDivWithClass('carousel__next')
      const prevButton = this.createDivWithClass('carousel__prev')
      this.root.appendChild(nextButton)
      this.root.appendChild(prevButton)
      // Bind this to the nextButton
      nextButton.addEventListener('click', this.next.bind(this))
      prevButton.addEventListener('click', this.prev.bind(this))
    }

    next(){
      this.gotoSlide(this.currentSlide + this.slidesToScroll)
      console.log(this.currentSlide);
      console.log(this.currentSlide > this.items.length - this.offset)
      console.log("this.items.length: ",this.items.length)
      console.log("this.offset: ",this.offset)
    }

    prev(){
      this.gotoSlide(this.currentSlide - this.slidesToScroll)
      // Current Slide can be negative
      console.log(this.currentSlide)
    }

    /**
     * 
     * @param {number} index 
     * @param {boolean} [animation = true] 
     */

    gotoSlide(index, animation = true){
      // Determine the % by which to scroll on the X axis with a 3D translate, negative value to go right.
      const translationX = index * -100/this.items.length
      if (animation === false){
        this.container.style.transition = 'none'
      }
      // Go back to last slide if clicking on previous from the first
      if (index < 0 ){
        index = this.items.length - this.options.visibleSlides
      } else if ( index >= this.items.length || this.items[this.currentSlide + this.visibleSlides] === "undefined"){
        index = -1
      }
      this.container.style.transform = `translate3d(${translationX}%,0,0)`
      // This forces a repaint
      this.container.offsetHeight
      if(animation === false){
        this.container.style.transition = ''
      }
      this.currentSlide = index  
      this.moveCallbacks.forEach(cb => cb(index))
    }

    /**
     * Moves container so that the scroll appears infinite
     */

    resetInfinite () {
      if (this.currentSlide <= this.options.slidesToScroll) {
        this.gotoSlide(this.currentSlide + (this.items.length - 2 * this.offset), false)
      } else if (this.currentSlide >= this.items.length - this.offset) {
        this.gotoSlide(this.currentSlide - (this.items.length - 2 * this.offset), false)
      }
    }

    createPagination(){
      const pagination = this.createDivWithClass('carousel__pagination')
      const buttons= []
      this.root.appendChild(pagination)
      for (let i = 0; i < (this.items.length - 2 * this.offset) ;i = i + this.options.slidesToScroll){
        const button = this.createDivWithClass('carousel__pagination__button')
        button.addEventListener('click', () => { this.gotoSlide(i + this.offset) })
        button.addEventListener('click', button => button.classList.add('active'))
        pagination.appendChild(button)
        buttons.push(button)
      }
      this.onMove(index => {
        let count = this.items.length - 2 * this.offset
        let activeButton = buttons[Math.floor(((index - this.offset) % count) / this.options.slidesToScroll)]
        if (activeButton) {
          buttons.forEach(button => button.classList.remove('carousel__pagination__button--active'))
          activeButton.classList.add('carousel__pagination__button--active')
        }
      })
    }
    /**
     * @returns {number}
     */

    get slidesToScroll(){
      return this.isMobile ? 1 : this.options.slidesToScroll
    }
      /**
   * Rajoute un écouteur qui écoute le déplacement du carousel
   * @param {moveCallback} cb
   */
    onMove (cb) {
    this.moveCallbacks.push(cb)
    }

    /** 
     * @returns {number}
     */
    get visibleSlides(){
      return this.isMobile ? 1 : this.options.visibleSlides
    }

    // Events
    onWindowResize(){
      const mobile = window.outerWidth < 800
      console.log(mobile)
      console.log(window.outerWidth)
      // We bound the this to the Carousel object, hence why we can call this.isMobile here.
      if (mobile !== this.isMobile){
        this.isMobile = mobile
        this.setStyle()
        this.moveCallbacks.forEach(cb => cb(this.currentItem))
      }
    }

  }

  const carouselHolder = document.querySelector('.carousel__panorama')
  if (carouselHolder){
    console.log(carouselHolder)
    new Carousel(carouselHolder, {
      visibleSlides: 2,
      pagination: true,
      infinite:true
    })
  }
  
