require 'pagy/extras/bootstrap'
# override some pagy default with your own in the pagy initializer
Pagy::DEFAULT[:items] = 10        # items per page
Pagy::DEFAULT[:size]  = [1,4,4,1] # nav bar links
