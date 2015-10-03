//
//  BatchActionsViewController.swift
//  CoreDataCRUD
//  Written by Steven R.
//

import UIKit

class BatchActionsViewController: UIViewController {

    private var eventAPI: EventAPI!
    private var replicator: LocalReplicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.eventAPI = EventAPI.sharedInstance
        self.replicator = LocalReplicator.sharedInstance
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func anonimizeListButtonTapped(sender: AnyObject) {
        eventAPI.anonimizeAttendeesList()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func deleteAllEventsButtonTapped(sender: AnyObject) {
        eventAPI.deleteAllEvents()       
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func restoreEventsButtonTapped(sender: AnyObject) {
        replicator.fetchData()
        NSNotificationCenter.defaultCenter().postNotificationName("setStateLoading", object: nil)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
