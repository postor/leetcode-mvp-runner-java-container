class Solution {
	public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
		return add(l1, l2, 0);
	}

	private ListNode add(ListNode la, ListNode lb, int step) {
		if (la == null && lb == null && step == 0)
			return null;
		int val = (la != null ? la.val : 0) + (lb != null ? lb.val : 0) + step;
		int newStep = val >= 10 ? 1 : 0;
		int newVal = val >= 10 ? val - 10 : val;

		ListNode node = new ListNode(newVal);
		node.next = add(la != null ? la.next : null, lb != null ? lb.next : null, newStep);
		return node;
	}
}