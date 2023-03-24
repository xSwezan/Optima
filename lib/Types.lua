local Types = {}

export type Props = {CanBeState<any>}
export type Dictionary<T> = {[string]: T}

export type Optima = {
	New: (ClassName: string) -> (Props: Props) -> Instance;

	Extensions: {
		ApplyProps: (props: Props, PropNames: {string}) -> nil;
	};
}

export type StateObject<T> = (DefaultState: T) -> {}
export type CanBeState<T> = StateObject<T> | T

export type Dependency = Instance

return Types