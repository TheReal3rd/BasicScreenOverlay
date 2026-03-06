extends Node


func toPercentage(value: float, minAmount:float, maxAmount:float) -> float:
	if value < minAmount or value > maxAmount:
		return 0.0 
	return  ((value - minAmount) / (maxAmount - minAmount)) * 100
	
#TBH i dont like returning 0 when overflow or under flow best to chose the closest match.
func fromPercentage(percentage: float, minAmount: float, maxAmount: float):
	if percentage < 0 or percentage > 100:
		return 0.0
	return ((percentage / 100) * (maxAmount - minAmount)) + minAmount
