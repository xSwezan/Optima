local PrivTypes = {}

export type StateObject = {
	__isState: boolean;
	__value: any;
	__changed: BindableEvent;
}

return PrivTypes