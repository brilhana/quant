# Sample Strategy to invest 100% of wealth in single stock
# Every strategy requires two mandatory functions
# 1. initialize(): Function to initialize the settings and
#    user defined parameters
# 2. ondata(): Function to define strategy logic

# Initialize the strategy with various settings and/or parameters
function initialize(state)
	# Set initial cash
	setcash(1000000.0)
	# Set Cancel policy to GTC (good till canceled)
	setcancelpolicy(CancelPolicy(GTC))
	# Set universe (mandatory before placing any orders)
	setuniverse(["TCS"])
end

# Define strategy logic here
# This function is called EVERY DAY
# However, the rebalance frequency can be
function ondata(data, state)
	# Get Universe
	universe = getuniverse()

	# Set the holding in all stock in universe to 100 shares
	for stock in universe
		# Function is called every Day/Week/Month based on rebalance frequency
		setholdingpct(stock, 1.0)
	end

	# Track the portfolio value
	track("portfoliovalue", state.account.netvalue)

	# User Logger to output information to console
	Logger.info("Portfolio Value = $(state.account.netvalue)")
end
